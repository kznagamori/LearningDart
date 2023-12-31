# スレッド

Dartでマルチスレッディングのような並行処理を行うには、`Isolate` を使用するのが一般的です。また、`Future` を使用した非同期処理もDartの並行処理の一形態です。以下に、それぞれのアプローチを用いたサンプルプログラムを示します。

## サンプルプログラム
以下のサンプルプログラムでは、複数の `Isolate` を起動し、それぞれが完了するのを待ち合わせます。
**isolate_example.dart**
```dart
import 'dart:async';
import 'dart:isolate';

// エントリポイント関数の型を定義する型エイリアス。
typedef Entrypoint = void Function(SendPort sendPort);

// Isolateを管理するクラス。
class IsolateManager {
  // Isolateの終了を待機するためのCompleter。
  final Completer<void> _completer = Completer<void>();
  final Entrypoint entrypoint;
  late final ReceivePort _receivePort;
  late final ReceivePort onExit;

  // コンストラクタでエントリポイント関数を受け取り、新しいIsolateを生成。
  IsolateManager(this.entrypoint) {
    _receivePort = ReceivePort();
    onExit = ReceivePort();
    // 新しいIsolateを生成し、終了時にCompleterを完了させる。
    Isolate.spawn(entrypoint, _receivePort.sendPort, onExit: onExit.sendPort)
        .then((Isolate isolate) {
      onExit.listen((_) {
        if (!_completer.isCompleted) {
          _completer.complete();
        }
        onExit.close();
      });
    });
  }

  // Isolateの終了を待機するメソッド。
  Future<void> join() async {
    await _completer.future;
  }

  // 使用されているリソースを解放するメソッド。
  void close() {
    _receivePort.close();
  }
}

// 最初のIsolateのエントリポイント関数。
Future<void> isolateFunc1(SendPort sendPort) async {
  await Future.delayed(const Duration(seconds: 5));
  print('isolateFunc1');
  // ここでIsolateの処理を実装。
}

// 2番目のIsolateのエントリポイント関数。
Future<void> isolateFunc2(SendPort sendPort) async {
  await Future.delayed(const Duration(seconds: 2));
  print('isolateFunc2');
  // ここでIsolateの処理を実装。
}

// main関数。
Future<void> main() async {
  // IsolateManagerのインスタンスを作成。
  List<IsolateManager> isolateManagers = [
    IsolateManager(isolateFunc1),
    IsolateManager(isolateFunc2)
  ];

  // すべてのIsolateの終了を待つ。
  await Future.wait([isolateManagers[0].join(), isolateManagers[1].join()]);

  // すべてのIsolateが終了したことを出力。
  print('All Isolates have completed');

  // 各IsolateManagerのリソースを解放。
  isolateManagers.forEach((manager) {
    manager.close();
  });
}
```

**future_example.dart**

複数の非同期処理（ `Future` ）を起動し、すべてが完了するのを待ち合わせます。
```dart
import 'dart:async';

Future<void> futureFunc1() async {
  await Future.delayed(const Duration(seconds: 5));
  print('futureFunc1');
  // ここで処理を実装。
}

Future<void> futureFunc2() async {
  await Future.delayed(const Duration(seconds: 2));
  print('futureFunc2');
  // ここで処理を実装。
}

void main() async {
  // 関数の呼び出しをリストに追加
  var futures = <Future<void>>[futureFunc1(), futureFunc2()];

  // すべてのFutureが完了するのを待つ
  await Future.wait(futures);

  print('すべての非同期処理が完了しました。');
}
```

`Isolate` を使用するパターンは、CPU集約型のタスクやメモリを共有しない並行処理に適しています。一方、`Future` を使用するパターンは、I/O操作や軽量な非同期処理に適しています。適切なアプローチは、アプリケーションの要件と処理の特性に基づいて選択してください。
