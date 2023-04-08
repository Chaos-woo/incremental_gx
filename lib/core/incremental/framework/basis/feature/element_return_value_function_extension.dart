import 'package:incremental_gx/core/incremental/framework/definition/fundamental/resource.dart';

typedef ResourceReturnElement = Resource Function();
extension ResourceReturnElementExtension on ResourceReturnElement {
  Resource get() => this.call();
}

typedef GenericReturnElement = R Function<R>();
extension GenericReturnElementExtension<R> on GenericReturnElement {
  R get() => this.call();
}

typedef GenericReturnDoubleElement = GenericReturnElement Function(double value);
typedef GenericReturnIntElement = GenericReturnElement Function(int value);
typedef GenericReturnStringElement = GenericReturnElement Function(String value);
typedef GenericReturnBoolElement = GenericReturnElement Function(bool value);

extension GenericReturnDoubleElementExtension on GenericReturnDoubleElement {
  GenericReturnElement getElement(double value) => this.call(value);
}

extension GenericReturnIntElementExtension on GenericReturnIntElement {
  GenericReturnElement getElement(int value) => this.call(value);
}

extension GenericReturnStringElementExtension on GenericReturnStringElement {
  GenericReturnElement getElement(String value) => this.call(value);
}

extension GenericReturnBoolElementExtension on GenericReturnBoolElement {
  GenericReturnElement getElement(bool value) => this.call(value);
}
