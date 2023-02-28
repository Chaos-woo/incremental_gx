/// 有效计算，即经过换算后的真实数据
typedef EffectiveComputable = T Function<T>();

/// double返回值类型计算节点
typedef DoubleEffectiveComputable = EffectiveComputable Function(double doubleVal);

/// double返回值类型计算节点实例
DoubleEffectiveComputable doubleEffectiveComputable = (double doubleVal) => <double>() => doubleVal as double;
