import 'dart:isolate';

typedef GameRenderNotifier = void Function(dynamic data);

/// 简单游戏渲染isolate
abstract class SimpleGameRender {
  final ReceivePort renderReceivePort;

  SimpleGameRender(this.renderReceivePort);

  void start() {
    renderReceivePort.listen((dynamic message) {
      notifier(message);
    });
  }

  GameRenderNotifier notifier(dynamic message);
}


/// main方式使用示例
/// void main() async {
//   // Create a send port for rendering events
//   final renderReceivePort = ReceivePort();
//   final renderSendPort = renderReceivePort.sendPort;
//
//   // Instantiate the game loop and start it
//   final gameLoop = GameLoop(60, renderSendPort);
//   gameLoop.start();
//
//   // Instantiate the render thread and start it with a rendering function
//   final renderThread = RenderThread(renderReceivePort);
//   renderThread.start(renderFunction);
//
//   // Wait for user input to stop the game loop and the render thread
//   await waitForUserInput();
//
//   // Stop the game loop and the render thread
//   gameLoop.stop();
//   Isolate.current.kill(priority: Isolate.immediate);
// }
//
// // Define a rendering function to be passed to the render thread
// void renderFunction(dynamic gameState) {
//   // Render the game state here
// }
//
// // Define a function to wait for user input
// Future<void> waitForUserInput() async {
//   // Wait for some user input or event
//   // For example:
//   await Future.delayed(Duration(seconds: 10));
// }
