import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/rate/exchange_rate.dart';

/// 货币兑换
class CurrencyExchangerX {
  static final CurrencyExchangerX _single = CurrencyExchangerX._internal();

  CurrencyExchangerX._internal();

  factory CurrencyExchangerX() => _single;

  static const Map<String, double> _currencyRates = {};

  /// 兑换
  T2 exchange<T1 extends Currency, T2 extends Currency>(T1 fromCurrency, T2 toCurrency) {
    String t1t2RateKey = _rateKey(fromCurrency.runtimeType, toCurrency.runtimeType);
    String t2t1RateKey = _rateKey(toCurrency.runtimeType, fromCurrency.runtimeType);
    if (_currencyRates.containsKey(t1t2RateKey)) {
      toCurrency.amount = fromCurrency.amount * _currencyRates[t2t1RateKey]!;
    } else if (_currencyRates.containsKey(t2t1RateKey)) {
      toCurrency.amount = fromCurrency.amount * (1 / _currencyRates[t2t1RateKey]!);
    } else {
      toCurrency.amount = 0.0;
    }
    return toCurrency;
  }

  /// 兑换比率存储
  void newRate(ExchangeRate eRate) {
    String t1t2RateKey = _rateKey(eRate.t1Type, eRate.t2Type);
    String t2t1RateKey = _rateKey(eRate.t2Type, eRate.t1Type);

    /// 保证T1、T2货币仅有一种货币兑换比率
    if (!_currencyRates.containsKey(t2t1RateKey)) {
      _currencyRates[t1t2RateKey] = eRate.rate;
    }
  }

  String _rateKey<T1 extends Currency, T2 extends Currency>(Type t1Type, Type t2Type) {
    return 'exc:rate:${t1Type.runtimeType}:${t2Type.runtimeType}';
  }
}
