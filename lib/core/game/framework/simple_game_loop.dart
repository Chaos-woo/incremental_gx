import 'dart:async';
import 'dart:isolate';

import 'package:incremental_gx/core/game/framework/events/game_event.dart';
import 'package:incremental_gx/core/game/framework/events/game_event_type.dart';
import 'package:incremental_gx/core/game/framework/game_loop_life_cycle.dart';

typedef GameLogic = void Function(int delta);
typedef GameRender = dynamic Function();

/// 简单游戏循环
abstract class SimpleGameLoop implements GameLoopLifeCycle {
  bool _started = false;
  bool _disposed = false;

  /// 渲染主isolate发送端口
  final SendPort renderSendPort;

  /// 逻辑计算子isolate
  late Isolate logicComputeIsolate;

  /// 桥接接受端口
  late ReceivePort bridgeReceivePort;

  /// 低优先级用户事件
  static final List<GameInputEvent> userEventQueue = [];

  /// 高优先级用户事件
  static final List<GameInputEvent> kernelEventQueue = [];

  /// 循环帧率
  static late final int targetFps;

  /// 恢复令牌
  Capability? _resumeCapability;

  SimpleGameLoop({
    required int fps,
    required this.renderSendPort,
  }) {
    targetFps = fps;

    onReady();
  }

  void start() async {
    if (_started) {
      return;
    }

    _started = true;

    onMainLoopPreStart();

    bridgeReceivePort = ReceivePort();
    logicComputeIsolate = await Isolate.spawn(_loop, [
      bridgeReceivePort.sendPort,
      gameLogic(),
      gameRender(),
    ]);
    bridgeReceivePort.listen(_handleBridgeIsolatePort);
  }

  void stop() async {
    if (_disposed) {
      return;
    }

    _disposed = true;
    onMainLoopPreStop();

    logicComputeIsolate.kill(priority: Isolate.immediate);
    onMainLoopDispose();
  }

  void suspend() async {
    onMainLoopSuspend();
    _resumeCapability = logicComputeIsolate.pause();
  }

  void resume() async {
    if (_resumeCapability != null) {
      onMainLoopResume();
      logicComputeIsolate.resume(_resumeCapability!);
      _resumeCapability = null;
    }
  }

  void _handleBridgeIsolatePort(dynamic message) {
    if (message is SendPort) {
      message.send(renderSendPort);
    }
  }

  void handleGameEvent(GameInputEvent event) {
    if (GameInputEventType.kernel == event.eventType) {
      kernelEventQueue.add(event);
    } else if (GameInputEventType.user == event.eventType) {
      userEventQueue.add(event);
    }
  }

  /// 游戏主循环运行逻辑
  GameLogic gameLogic();

  /// 游戏渲染数据逻辑
  GameRender gameRender();

  /// 计算模块-isolate
  static void _loop(List<dynamic> args) {
    SendPort bridgeSendPort = args[0] as SendPort;
    GameLogic gameLogic = args[1] as GameLogic;
    GameRender gameRender = args[2] as GameRender;
    final logicReceivePort = ReceivePort();

    bridgeSendPort.send(logicReceivePort.sendPort);

    SendPort? renderSendPort;
    logicReceivePort.listen((dynamic message) {
      if (message is SendPort) {
        renderSendPort = message;
      } else if (message is GameInputEvent) {
        if (GameInputEventType.kernel == message.eventType) {
          kernelEventQueue.add(message);
        } else if (GameInputEventType.user == message.eventType) {
          userEventQueue.add(message);
        }
      }
    });

    final frameDuration = Duration(microseconds: (1000 / targetFps).round());
    int lastLoopMillSeconds = DateTime.now().millisecondsSinceEpoch;
    Timer.periodic(frameDuration, (_) {
      final delta = DateTime.now().millisecondsSinceEpoch - lastLoopMillSeconds;
      for (var event in userEventQueue) {
        event.callback.call(delta);
      }

      for (var event in kernelEventQueue) {
        event.callback.call(delta);
      }

      gameLogic.call(delta);

      lastLoopMillSeconds = DateTime.now().millisecondsSinceEpoch;

      renderSendPort?.send(gameRender.call());
    });
  }
}
