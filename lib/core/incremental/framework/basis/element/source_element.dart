/// 定义来源元素节点
typedef SourceElement = String Function();

/// 默认实现 - 【无来源】
SourceElement noSource = () => 'Oh? It seems to have no origin.';

/// 默认实现 - 【无背景故事】
SourceElement noStory = () => 'Oh? His/her resume is blank.';
