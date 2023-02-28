/// 定义Tick元素节点
typedef TickElement = int Function();

/// 辅助类
typedef TickerElement = TickElement Function(int tick);

TickerElement tickerElement = (int tick) {
  assert(tick > 1);
  return () => tick;
};
