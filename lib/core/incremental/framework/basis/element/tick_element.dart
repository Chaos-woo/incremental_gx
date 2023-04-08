import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';

/// 定义Tick元素节点，基础时间元素
typedef TickElement = int Function();

extension TickElementExtension on TickElement {
  TickElement plus(TickElement tick) {
    int ret = get() + tick.get();
    return () => ret;
  }

  TickElement subtract(TickElement tick) {
    int ret = get() - tick.get();
    return () => ret;
  }

  TickElement multiply(int multiple) {
    int ret = get() * multiple;
    return () => ret;
  }
}
