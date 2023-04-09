import 'dart:math';

import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';
import 'package:incremental_gx/core/incremental/framework/definition/drive/computable/effective_computable.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/computable/generate_base_factor.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/generator.dart';

/// 定义生成器货币运算单元
class EffectiveCurrencyGenerateComputable {
  /// 当前生成器
  final Generator gen;

  /// 运算基础生成因子
  final GenerateBaseFactor factor;

  /// 有效生产概率计算
  final DoubleEffectiveComputable? effectiveProduceProbability;

  /// 有效生产速率计算
  final DoubleEffectiveComputable? effectiveProduceRate;

  EffectiveCurrencyGenerateComputable({
    required this.gen,
    required this.factor,
    required this.effectiveProduceProbability,
    required this.effectiveProduceRate,
  });

  /// 计算单位时间货币生产量
  double compute(int delta) {
    double probability = (effectiveProduceProbability != null)
        ? effectiveProduceProbability?.getElement(factor.baseProduceProbability.get()).get() as double
        : factor.baseProduceProbability.get();

    double rate = (effectiveProduceRate != null)
        ? effectiveProduceRate?.call(factor.baseProduceRate.get()).get() as double
        : factor.baseProduceRate.get();

    bool generatable = true;
    if (probability < 1.0) {
      Random random = Random();
      if (random.nextDouble() > probability) {
        generatable = false;
      }
    }

    return generatable ? factor.baseGenerateAmount.amount * (1 + rate) * delta : 0.0;
  }
}
