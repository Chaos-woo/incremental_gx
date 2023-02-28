import 'package:incremental_gx/core/incremental/framework/basis/element/probability_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/rate_element.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';

/// 定义基础生成因子属性
class GenerateBaseFactor {
  /// 单元生产量
  final Currency baseGenerateAmount;

  /// 基础生成概率
  final ProbabilityElement baseProduceProbability;

  /// 基础生产速率
  final RateElement baseProduceRate;

  /// 额外参数
  Map<String, dynamic> extra;

  GenerateBaseFactor({
    required this.baseGenerateAmount,
    required this.baseProduceProbability,
    required this.baseProduceRate,
    this.extra = const {},
  });
}
