import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/source_element.dart';

/// 定义角色属性
abstract class Character {
  IdentifierElement identifier();

  NameElement name();

  DescriptionElement description();

  SourceElement story() => noStory;
}
