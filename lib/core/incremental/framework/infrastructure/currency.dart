import 'package:incremental_gx/core/incremental/framework/basis/element/abbreviation_element.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/resource.dart';

/// 定义货币属性
abstract class Currency extends Resource {
  /// 货币数量
  double amount = 0.00;

  /// 缩写
  AbbreviationElement abbreviation();

  Currency({double? amount}) {
    this.amount = amount ?? 0.0;
  }

  void plus(Currency currency) {
    amount += currency.amount;
  }

  void subtract(Currency currency) {
    amount -= currency.amount;
  }
}
