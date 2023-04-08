/// 定义概率元素节点
typedef ProbabilityElement = double Function();

typedef NormalizedProbabilityElement = ProbabilityElement Function(double probability);

/// 辅助类
NormalizedProbabilityElement normalizedProbability = (double probability) {
  assert(probability >= 0.0 && probability <= 1.0);
  return () => probability;
};

// extension NormalizedProbabilityElementExtension on NormalizedProbabilityElement {
//   ProbabilityElement getElement(double probability) => this.call(probability);
// }
