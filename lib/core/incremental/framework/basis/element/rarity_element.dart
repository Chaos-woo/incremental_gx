/// 定义稀有度元素节点
typedef RarityElement = int Function();

/// 辅助类
typedef IntRarityElement = RarityElement Function(int rarity);

IntRarityElement intRarityElement = (int rarity) {
  return () => rarity;
};

// extension IntRarityElementExtension on IntRarityElement {
//   RarityElement getElement(int rarity) => this.call(rarity);
// }
