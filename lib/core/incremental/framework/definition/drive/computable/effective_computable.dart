/// 有效计算，即经过换算后的真实数据
typedef EffectiveComputable = R Function<R>();

/// double返回值类型计算节点
typedef DoubleEffectiveComputable = EffectiveComputable Function(double doubleVal);

// extension DoubleEffectiveComputableExtension on DoubleEffectiveComputable {
//   EffectiveComputable getElement(double doubleVal) => this.call(doubleVal);
// }

/// double返回值类型计算节点实例
DoubleEffectiveComputable doubleEffectiveComputable = (double doubleVal) => <double>() => doubleVal as double;