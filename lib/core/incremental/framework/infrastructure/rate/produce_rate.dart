import 'package:incremental_gx/core/incremental/framework/basis/element/rate_element.dart';

/// double类型生产速率实现
typedef DoubleProduceRate = RateElement Function(double rate);

/// int类型生产速率实现
typedef IntProduceRate = RateElement Function(int rate);

/// 辅助类
DoubleProduceRate doubleProduceRate = (double rate) {
  assert(rate >= 0.0);
  return <double>() => rate as double;
};

IntProduceRate intProduceRate = (int rate) {
  assert(rate >= 0);
  return <int>() => rate as int;
};
