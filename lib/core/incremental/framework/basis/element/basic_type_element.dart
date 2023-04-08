/// 定义基础元素节点
typedef BoolElement = bool Function();
typedef StringElement = String Function();
typedef IntElement = int Function();
typedef DoubleElement = double Function();

extension BoolElementElementExtension on BoolElement {
  bool get() => this.call();
}

extension StringElementExtension on StringElement {
  String get() => this.call();
}

extension IntElementElementExtension on IntElement {
  int get() => this.call();
}

extension DoubleElementExtension on DoubleElement {
  double get() => this.call();
}
