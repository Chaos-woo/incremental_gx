import 'dart:math';

import 'package:incremental_gx/core/incremental/framework/definition/drive/computable/formula.dart';

/// 范围随机数正态分布公式参数
class RangeNormalDistributionFormulaArgs extends FormulaArguments {
  final double minVal;
  final double maxVal;

  /// 标准差浮动值
  final double? stdDevFloatVal;

  RangeNormalDistributionFormulaArgs({required this.minVal, required this.maxVal, this.stdDevFloatVal});
}

/// 范围随机数正态分布公式实现
Formula rangeNormalDistribution = <double>(FormulaArguments arg) {
  var arg0 = arg as RangeNormalDistributionFormulaArgs;
  return _normalDistribution(arg0.minVal, arg0.maxVal, stdDevFloatVal: arg0.stdDevFloatVal) as double;
};

/// 范围随机数正态分布算法
double _normalDistribution(double minVal, double maxVal, {double? stdDevFloatVal}) {
  assert(minVal < maxVal);

  double median0 = (minVal + maxVal) / 2;
  double stdDev0 = (maxVal - minVal + (stdDevFloatVal ?? 0.0)) / 6;

  assert(stdDev0 > 0);

  final random = Random();
  double u1 = 1.0 - random.nextDouble(); // (0,1]随机数1
  double u2 = 1.0 - random.nextDouble(); // (0,1]随机数2
  double randStdNormal = sqrt(-2.0 * log(u1)) * sin(2.0 * pi * u2); // 归一化(0,1)
  double randNormal = median0 + stdDev0 * randStdNormal; // 正态分布随机计算
  randNormal = max(minVal, randNormal); // 确保随机值大于等于最小值
  randNormal = min(maxVal, randNormal); // 确保随机值小于等于最大值
  return randNormal;
}
