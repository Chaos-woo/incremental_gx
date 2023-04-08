/// 定义可计算的公式元素
typedef Formula = R Function<R>(FormulaArguments arguments);

extension FormulaExtension<R> on Formula {
  R compute(FormulaArguments arguments) => this.call(arguments);
}

/// 定义公式元素的参数元素
abstract class FormulaArguments {}

/// 默认实现 - 【无参数】
class EmptyFormulaArguments extends FormulaArguments {}
