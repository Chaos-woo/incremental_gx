import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/feature/element_return_value_function_extension.dart';

/// 定义成就基本属性
abstract class Achievement {
  /// 成就完成时间
  DateTime? completeTime;

  /// 成就标识符
  IdentifierElement identifier();

  /// 成就名称
  NameElement name();

  /// 成就描述
  DescriptionElement description();

  /// 成就是否解锁（前置条件）
  bool blocking();

  /// 成就完成检查
  bool completeChecker();

  @override
  bool operator ==(Object other) {
    return equals(other);
  }

  bool equals(Object other);

  @override
  int get hashCode => identifier().get().hashCode;
}
