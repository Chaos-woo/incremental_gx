import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/rarity_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/stackable_element.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/character.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/pocket.dart';
import 'package:incremental_gx/core/incremental/framework/definition/fundamental/resource.dart';

/// 定义物品属性
abstract class Item extends Resource {
  /// 所属角色
  final Character belongTo;

  /// 所属口袋
  final Pocket pocket;
  
  /// 物品稀有度
  final RarityElement rarity;

  /// 物品类型
  ItemType itemType;

  /// 当前叠加数量
  int stackCnt = 1;

  /// 物品磨损值，-1为不可损坏，可损坏物品当磨损值为0时即损坏
  double wearValue = -1.0;

  Item({
    required this.belongTo,
    required this.pocket,
    required this.itemType,
    required this.rarity,
    this.wearValue = -1.0,
  });

  /// 是否可叠加
  StackableElement stackable() => () => false;

  /// 最大叠加数量
  MaxStackableTimesElement maxStackableTimes() => () => 1;

  /// 是否可交易
  BoolElement tradable() => () => false;

  /// 是否可出售
  BoolElement salability() => () => true;

  /// 是否可丢弃
  BoolElement disposable() => () => true;

  /// 是否可损坏
  BoolElement damageable() => () => false;

  /// 是否可分解
  BoolElement decomposable() => () => false;
}

enum ItemType {
  equipment, // 装备型
  consumable, // 消耗型
  taskBased, // 任务型
  material, // 材料型
  other, // 其他
}
