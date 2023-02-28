import 'package:incremental_gx/core/incremental/framework/basis/element/rate_element.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';

/// 定义货币交换比率
class ExchangeRate<T1 extends Currency, T2 extends Currency> {
  /// T1类型货币
  late final Type t1Type;

  /// T2类型货币
  late final Type t2Type;

  /// T1转T2类型比率
  late final double rate;

  ExchangeRate(T1 fromCurrency, T2 toCurrency, RateElement rate) {
    t1Type = fromCurrency.runtimeType;
    t2Type = toCurrency.runtimeType;
    this.rate = rate.call();
  }
}
