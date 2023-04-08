import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/source_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';

/// 定义口袋属性
abstract class Pocket {
  /// 口袋标识符
  IdentifierElement identifier();

  /// 口袋名称
  NameElement name();

  /// 口袋描述
  DescriptionElement description();

  /// 口袋来源
  SourceElement source() => () => 'pocket-${name()}';

  @override
  bool operator ==(Object other) {
    return equals(other);
  }

  bool equals(Object other);

  @override
  int get hashCode => identifier().get().hashCode;
}
