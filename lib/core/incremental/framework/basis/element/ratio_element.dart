import 'package:incremental_gx/core/incremental/framework/basis/element/basic_type_element.dart';

/// 定义比例元素节点
typedef RatioElement = double Function();

typedef NormalizedRatioElement = RatioElement Function(double ratio);
typedef SpacerRatioElement = RatioElement Function(List<RatioElement> ratios);

/// 辅助类
NormalizedRatioElement normalizedRatio = (double ratio) {
  assert(ratio >= 0.0 && ratio <= 1.0);
  return () => ratio;
};

SpacerRatioElement ratioSpacer = (List<RatioElement> ratios) {
  double baseRatio = 1.0;
  for (var ratio in ratios) {
    baseRatio -= ratio.get();
  }

  return normalizedRatio(baseRatio);
};

// extension NormalizedRatioElementExtension on NormalizedRatioElement {
//   RatioElement getElement(double ratio) => this.call(ratio);
// }

extension SpacerRatioElementExtension on SpacerRatioElement {
  RatioElement getElement(List<RatioElement> ratios) => this.call(ratios);
}

class RadioElementsX {
  static final RadioElementsX _single = RadioElementsX._internal();

  RadioElementsX._internal();

  factory RadioElementsX() => _single;

  List<RatioElement> radioElementsChecker(List<RatioElement> ratios) {
    ratios = ratios.where((ratio) => ratio.get() <= 0.0).toList();
    assert(ratios.map((ratio) => ratio.get()).reduce((ratioVal, otherRatioVal) => ratioVal + otherRatioVal) > 1.0);
    return ratios;
  }
}
