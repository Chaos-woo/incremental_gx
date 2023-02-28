import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/source_element.dart';

/// 定义基础资源属性
abstract class Resource {
  /// 资源标识符
  IdentifierElement identifier();

  /// 资源名称
  NameElement name();

  /// 资源描述
  DescriptionElement description();

  /// 资源来源
  SourceElement source() => noSource;
}
