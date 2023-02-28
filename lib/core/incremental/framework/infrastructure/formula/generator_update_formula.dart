import 'dart:math';

import 'package:incremental_gx/core/incremental/framework/definition/drive/computable/formula.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';

/// 生成器升级花费普通公式
class OrdinaryCurrencyUpdateFormulaArgs extends FormulaArguments {
  final double baseVariable;
  final int currentLevel;
  final Currency baseCost;

  OrdinaryCurrencyUpdateFormulaArgs({required this.baseVariable, required this.currentLevel, required this.baseCost});
}

/// 生成器升级花费普通公式
Formula ordinaryCurrencyUpdateFormula = <Currency>(FormulaArguments arg) {
  var arg0 = arg as OrdinaryCurrencyUpdateFormulaArgs;
  var costCurrency = arg0.baseCost;
  costCurrency.amount = costCurrency.amount * pow(arg0.baseVariable, arg0.currentLevel);
  return costCurrency as Currency;
};
