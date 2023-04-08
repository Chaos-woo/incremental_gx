import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';

/// 定义世界基本属性
abstract class World {
  /// 世界标识符
  IdentifierElement identifier();

  /// 世界名称
  NameElement name();

  /// 世界描述
  DescriptionElement description();


  @override
  bool operator ==(Object other) {
    return equals(other);
  }

  bool equals(Object other);

  @override
  int get hashCode => identifier().get().hashCode;
}
