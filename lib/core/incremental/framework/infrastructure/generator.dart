import 'package:incremental_gx/core/incremental/framework/basis/element/level_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/price_element.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/effect.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/resource.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/combination/updater.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/computable/effective_currency_generate_factor.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/computable/generate_base_factor.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/currency.dart';

/// 定义生成器属性
abstract class Generator extends Resource {
  /// 生成器当前支持的升级器列表
  final List<Updater> updaters = const [];

  /// 生成器当前效果列表
  final List<Effect> effects = const [];

  /// 生成器升级历史记录
  final List<Updater> updateHistory = const [];

  /// 生成器当前等级
  int level = 1;

  /// 生成器购买价格
  List<PriceElement> purchasePrice();

  /// 生成器售卖价格
  List<PriceElement> sellingPrice();

  /// 生成器最大等级
  LevelElement maxLevel();

  /// 支持生产的资源列表
  Map<Currency, GenerateBaseFactor> supportGenerateResources();

  /// 货币生成运算单元
  Map<Currency, EffectiveCurrencyGenerateComputable> effectiveCurrencyGenerateUnits();

  /// 固定消耗的资源列表
  Map<Resource, double> fixedConsumeResource() => const {};

  /// 是否符合资源生产
  bool generateChecker() => fixedConsumeResource().isEmpty ? true : false;

  /// 当前是否可升级
  bool canUpdate() => updaters.isNotEmpty;

  /// 生成器实际资源生产
  List<Currency> generate(int delta);

  /// 生成器升级
  bool update(Updater updater) {
    if (!canUpdate() // 生成器是否可升级
            ||
            updater.blocking() // 升级器是否解锁
            ||
            !updater.supportGenUpdate(this) // 升级器是否支持当前生成器升级
            ||
            !updater.updateChecker() // 当前条件升级器是否支持生成器升级
        ) {
      return false;
    }

    updaters.remove(updater);
    updateHistory.add(updater);

    return true;
  }
}
