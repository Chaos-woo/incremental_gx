import 'package:incremental_gx/core/incremental/framework/basis/element/description_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/identifier_element.dart';
import 'package:incremental_gx/core/incremental/framework/basis/element/name_element.dart';

/// 定义脚本
abstract class Script {
  /// 脚本标识符
  IdentifierElement identifier();

  /// 脚本名称
  NameElement name();

  /// 脚本描述
  DescriptionElement description();
}

/// 定义无返回值脚本
abstract class RunnableScript extends Script {
  Future<void> execute();
}

/// 定义有返回值脚本
abstract class CallbackScript extends Script {
  Future<void> execute(void Function(dynamic result) callback);
}