import 'package:incremental_gx/core/incremental/framework/basis/element/abbreviation_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';

/// 定义职业
abstract class Occupation {
  /// 职业标识符
  IdentifierElement identifier();

  /// 职业名称
  NameElement name();

  /// 职业描述
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
