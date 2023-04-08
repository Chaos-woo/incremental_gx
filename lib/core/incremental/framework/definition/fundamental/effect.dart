import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/stackable_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/tick_element.dart';

/// 定义基础效果属性
abstract class Effect {
  /// 剩余持续时间
  late int remainingDuration;

  /// 当前已叠加效果次数
  int _stackCount = 1;

  /// 效果时限类型
  final EffectTimingType timingType;

  /// 效果类型
  final EffectType effectType;

  Effect(this.timingType, this.effectType) {
    remainingDuration = duration().get();
  }

  /// 效果标识符
  IdentifierElement identifier();

  /// 效果名称
  NameElement name();

  /// 效果描述信息
  DescriptionElement description();

  /// 效果可持续时间
  TickElement duration();

  /// 效果生效延时时间
  TickElement effectiveDelay();

  /// 效果是否可叠加
  StackableElement stackable() => () => false;

  /// 效果最大叠加数量
  MaxStackableTimesElement maxStackableTimes() => () => 1;

  /// 减少剩余持续时间
  void reduceRemainingDuration(TickElement tick) {
    remainingDuration -= tick.get();
  }

  /// 效果是否结束
  bool finished() {
    return remainingDuration <= 0;
  }

  /// 终止效果
  void terminate() {
    remainingDuration = 0;
  }

  /// 叠加效果
  void stackEffect({TickElement? tick}) {
    if (!stackable().get()) {
      return;
    }

    if (_stackCount + 1 > maxStackableTimes().get()) {
      return;
    }

    _stackCount++;
    if (tick != null) {
      remainingDuration += tick.get();
    } else {
      remainingDuration += duration().get();
    }
  }
}

/// 效果时限类型
enum EffectTimingType {
  terminable, // 有期限的
  timeless, // 无期限的
}

/// 效果类型
enum EffectType {
  positive, // 增益效果
  negative, // 减益效果
}
