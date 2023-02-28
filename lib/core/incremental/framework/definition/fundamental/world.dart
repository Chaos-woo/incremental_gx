import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';

/// 定义世界基本属性
abstract class World {
  /// 世界标识符
  IdentifierElement identifier();

  /// 世界名称
  NameElement name();

  /// 世界描述
  DescriptionElement description();
}
