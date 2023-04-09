/// 游戏循环生命周期
abstract class GameLoopLifeCycle {
  /// 运行准备
  void onReady();

  /// 游戏主循环开始前，仅一次执行
  void onMainLoopPreStart();

  /// 游戏主循环退出前，仅一次执行
  void onMainLoopPreStop();

  /// 游戏主循环线程销毁前，仅一次执行
  void onMainLoopDispose();

  /// 游戏主循环暂停
  void onMainLoopSuspend();

  /// 游戏主循环恢复
  void onMainLoopResume();
}
