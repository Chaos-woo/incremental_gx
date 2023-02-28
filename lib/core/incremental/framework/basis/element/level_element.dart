/// 定义等级元素节点
typedef LevelElement = int Function();

/// 辅助类
typedef IntLevelElement = LevelElement Function(int level);

IntLevelElement intLevelElement = (int level) {
  return () => level;
};
