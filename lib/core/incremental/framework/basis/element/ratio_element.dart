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
    baseRatio -= ratio.call();
  }

  return normalizedRatio(baseRatio);
};

class RadioElementsX {
  static final RadioElementsX _single = RadioElementsX._internal();

  RadioElementsX._internal();

  factory RadioElementsX() => _single;

  List<RatioElement> radioElementsChecker(List<RatioElement> ratios) {
    ratios = ratios.where((ratio) => ratio.call() <= 0.0).toList();
    assert(ratios.map((ratio) => ratio.call()).reduce((ratioVal, otherRatioVal) => ratioVal + otherRatioVal) > 1.0);
    return ratios;
  }
}
