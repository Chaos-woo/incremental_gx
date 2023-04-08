import 'package:incremental_gx/core/incremental/framework/basis/element/abbreviation_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';

/// 定义角色能力
abstract class CharacterAbility {
  /// 能力标识符
  IdentifierElement identifier();

  /// 能力名称
  NameElement name();

  /// 能力描述
  DescriptionElement description();

  /// 缩写
  AbbreviationElement abbreviation();

  @override
  bool operator ==(Object other) {
    return equals(other);
  }

  bool equals(Object other);

  @override
  int get hashCode => identifier().get().hashCode;
}
