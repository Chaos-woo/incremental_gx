/// 定义比率元素节点
typedef RateElement = R Function<R>();

/// double类型比率实现
typedef DoubleRateElement = RateElement Function(double rate);

/// int类型比率实现
typedef IntRateElement = RateElement Function(int rate);

/// 辅助类
DoubleRateElement doubleRateElement = (double rate) => <double>() => rate as double;
IntRateElement intRateElement = (int rate) => <int>() => rate as int;

// extension DoubleRateElementExtension on DoubleRateElement {
//   RateElement getElement(double rate) => this.call(rate);
// }
//
// extension IntRateElementExtension on IntRateElement {
//   RateElement getElement(int rate) => this.call(rate);
// }