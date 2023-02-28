import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/level_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/effect.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/resource.dart';
import 'package:incremental_gx/core/incremental/framework/infrastructure/generator.dart';

/// 定义升级所需资源
abstract class Updater {
  /// 升级所需花费资源
  final List<Resource> cost;

  /// 升级器升级带来的效果
  final List<Effect> effects;

  Updater({required this.cost, required this.effects});

  /// 升级器名称
  NameElement name();

  /// 升级器描述
  DescriptionElement description();

  /// 升级器等级，代表升级器的升级效果等级
  LevelElement level();

  /// 升级检查
  bool updateChecker();

  /// 该升级器是否处于未解锁阶段（前置条件）
  bool blocking();

  /// 是否支持该生成器升级
  bool supportGenUpdate(Generator gen);
}
