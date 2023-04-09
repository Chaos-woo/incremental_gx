import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/processing_callback_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/switch_callback_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/tick_element.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/generator.dart';

/// 定义生成器自动化
abstract class Automator {
  final Generator _generator;

  /// 运行开关状态
  bool switcher = false;

  /// 自动化器打开回调
  SwitchCallbackElement? turnOnCallback;

  /// 自动化器关闭回调
  SwitchCallbackElement? turnOffCallback;

  /// 生成器运算前回调
  ProcessingCallbackElement? preGenerateCallback;

  /// 生成器运算后回调
  ProcessingCallbackElement? postGenerateCallback;

  /// 展示名称前缀
  String displayPrefix = '';

  /// 展示名称后缀
  String displaySuffix = '';

  Automator({
    required Generator generator,
    this.turnOnCallback,
    this.turnOffCallback,
    this.preGenerateCallback,
    this.postGenerateCallback,
    String? displayPrefix,
    String? displaySuffix,
  }) : _generator = generator {
    this.displayPrefix = displayPrefix ?? '';
    this.displaySuffix = displaySuffix ?? '';
  }

  String name() => displayPrefix + _generator.name().get() + displaySuffix;

  void turnOn() {
    switcher = true;
    turnOnCallback?.call();
  }

  void turnOff() {
    switcher = false;
    turnOffCallback?.call();
  }

  List<Currency> processing(int delta) {
    preGenerateCallback?.call();
    List<Currency> currencies = _generator.generate(delta);
    postGenerateCallback?.call();
    return currencies;
  }
}

/// 定义拟真自动化器
class IntermittentAutomator extends Automator {
  /// 运行闲置时间
  final TickElement idleTick;

  /// 运行工作时间
  final TickElement workingTick;

  /// 已运行tick
  int _workingTick = 0;

  /// 剩余闲置tick
  int _remainingIdleTick = 0;

  /// 进入工作状态回调
  SwitchCallbackElement? workingCallback;

  /// 进入闲置状态回调
  SwitchCallbackElement? idleCallback;

  /// 工作状态转换
  bool _workStatusSwitchIntoIdle = true;
  bool _workStatusSwitchIntoWorking = true;

  IntermittentAutomator({
    required Generator generator,
    required this.idleTick,
    required this.workingTick,
    this.workingCallback,
    this.idleCallback,
    SwitchCallbackElement? turnOnCallback,
    SwitchCallbackElement? turnOffCallback,
    ProcessingCallbackElement? preGenerateCallback,
    ProcessingCallbackElement? postGenerateCallback,
    String? displayPrefix,
    String? displaySuffix,
  }) : super(
          generator: generator,
          turnOnCallback: turnOnCallback,
          turnOffCallback: turnOffCallback,
          preGenerateCallback: preGenerateCallback,
          postGenerateCallback: postGenerateCallback,
          displayPrefix: displayPrefix,
          displaySuffix: displaySuffix,
        ) {
    _workingTick = 0;
    _remainingIdleTick = idleTick.get();
  }

  @override
  List<Currency> processing(int delta) {
    if (_workingTick > workingTick.get() && _remainingIdleTick > 0) {
      /// 达到最大运行时间，进入机器闲置冷却时间
      _remainingIdleTick -= delta as int;

      if (_workStatusSwitchIntoIdle) {
        idleCallback?.call();
        _workStatusSwitchIntoWorking = true;
        _workStatusSwitchIntoIdle = false;
      }

      return [];
    }

    /// 工作时间增加
    _workingTick += delta as int;

    if (_remainingIdleTick <= 0) {
      /// 机器闲置冷却完成，进入工作状态
      /// 工作时间重置
      _workingTick = 0;
      _remainingIdleTick = idleTick.get();

      if (_workStatusSwitchIntoWorking) {
        workingCallback?.call();
        _workStatusSwitchIntoIdle = true;
        _workStatusSwitchIntoWorking = false;
      }
    }

    return super.processing(delta);
  }
}

/// 定义无限制自动化器
class PerpetualAutomator extends Automator {
  PerpetualAutomator({
    required Generator generator,
    SwitchCallbackElement? turnOnCallback,
    SwitchCallbackElement? turnOffCallback,
    ProcessingCallbackElement? preGenerateCallback,
    ProcessingCallbackElement? postGenerateCallback,
    String? displayPrefix,
    String? displaySuffix,
  }) : super(
          generator: generator,
          turnOnCallback: turnOnCallback,
          turnOffCallback: turnOffCallback,
          preGenerateCallback: preGenerateCallback,
          postGenerateCallback: postGenerateCallback,
          displayPrefix: displayPrefix,
          displaySuffix: displaySuffix,
        );
}
