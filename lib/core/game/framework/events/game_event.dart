import 'package:incremental_gx/core/game/framework/events/game_event_type.dart';

typedef EventExecuteCallback = void Function(int delta);

/// 游戏输入事件
class GameInputEvent {
  final GameInputEventType eventType;
  final EventExecuteCallback callback;
  final int created;

  GameInputEvent(
    this.eventType,
    this.callback,
  ) : created = DateTime.now().millisecondsSinceEpoch;
}
