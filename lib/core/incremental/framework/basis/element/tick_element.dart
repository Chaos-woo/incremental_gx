/// 定义Tick元素节点，基础时间元素
typedef TickElement = int Function();

extension TickElementOperate on TickElement {
  TickElement plus(TickElement tick) {
    int ret = this.call() + tick.call();
    return () => ret;
  }

  TickElement subtract(TickElement tick) {
    int ret = this.call() - tick.call();
    return () => ret;
  }

  TickElement multiply(int multiple) {
    int ret = this.call() * multiple;
    return () => ret;
  }
}
