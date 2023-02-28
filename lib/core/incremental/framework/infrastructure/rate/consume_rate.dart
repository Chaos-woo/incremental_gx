import 'package:incremental_gx/core/incremental/framework/basis/element/rate_element.dart';

/// double类型消耗速率实现
typedef DoubleConsumeRate = RateElement Function(double rate);

/// int类型消耗速率实现
typedef IntConsumeRate = RateElement Function(int rate);

/// 辅助类
DoubleConsumeRate doubleConsumeRate = (double rate) {
  assert(rate <= 0.0);
  return <double>() => rate as double;
};

IntConsumeRate intConsumeRate = (int rate) {
  assert(rate <= 0);
  return <int>() => rate as int;
};
