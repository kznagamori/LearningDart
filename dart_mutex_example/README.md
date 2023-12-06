# 排他処理

Dartの `Isolate` は独立したメモリ空間を持つため、共有データへの直接的なアクセスと排他処理は異なるアプローチで実装する必要があります。同様に、`Future` を使用した非同期処理では排他制御のために特別な考慮が必要です。

## 1. Isolateを使用したパターン

この例では、複数の `Isolate` が同じデータにアクセスするためのリクエストを中央のリソース管理 `Isolate` に送信します。リソース管理 `Isolate` はこれらのリクエストを順番に処理し、排他制御を実現します。

**isolate_example.dart**
```dart
import 'dart:isolate';
import 'dart:async';

// リソース管理Isolateへのリクエストを表すクラス
class DataRequest {
  final String message; // リクエストのメッセージ
  final SendPort replyPort; // リクエストの結果を送信するためのSendPort

  DataRequest(this.message, this.replyPort);
}

// リソース管理Isolateの処理を担当する関数
void resourceManager(SendPort sendPort) {
  int value = 0; // 共有リソース（この例では単なる整数値）
  final receivePort = ReceivePort(); // このIsolateのメッセージを受け取るためのReceivePort
  sendPort.send(receivePort.sendPort); // メインIsolateにこのIsolateのSendPortを送信

  // リクエストを受け取るリスナーを設定
  receivePort.listen((dynamic message) {
    if (message is DataRequest) {
      value++; // リソースの値をインクリメント
      print('Resource Manager: Value incremented to $value');
      message.replyPort.send(value); // 結果をリクエスト元に送信
    }
  });
}

// ワーカーIsolateの処理を担当する関数
Future<void> worker(SendPort managerSendPort) async {
  final receivePort = ReceivePort();
  final completer = Completer<void>();

  // リクエストの結果を受け取るリスナーを設定
  receivePort.listen((data) {
    print('Worker received updated value: $data');
    receivePort.close(); // ReceivePortを閉じる
    completer.complete(); // 処理が完了したことを通知
  });

  // リソース管理Isolateにリクエストを送信
  managerSendPort.send(DataRequest('Increment', receivePort.sendPort));
  return completer.future; // 処理の完了を待機
}

void main() async {
  final receivePort = ReceivePort();
  // リソース管理Isolateを起動
  await Isolate.spawn(resourceManager, receivePort.sendPort);
  // リソース管理IsolateのSendPortを取得
  final managerSendPort = await receivePort.first as SendPort;

  // 各ワーカーIsolateの処理の完了を待機
  final workers = <Future<void>>[];
  for (int i = 0; i < 3; i++) {
    workers.add(worker(managerSendPort));
  }
  await Future.wait(workers); // すべてのワーカーが完了するまで待機

  print('All workers completed'); // すべてのワーカーの完了を報告

  receivePort.close(); // メインIsolateのReceivePortを閉じる
}
```

## 2. Futureを使用したパターン
Dartでは、非同期処理が行われる際、単一のスレッド上でイベントループによって処理されるため、通常は排他処理を意識する必要はありません。ただし、`async` 関数の中で共有データにアクセスする場合、データ競合を避けるために適切な処理が必要です。

以下のコードは、共有データに対する非同期処理を行い、それぞれの非同期処理で共有データをカウントアップする例です。
**future_example.dart**
```dart
// 共有データ
class SharedData {
  int value = 0;
}

// 非同期関数。共有データをカウントアップする
Future<void> asyncIncrement(SharedData sharedData) async {
  await Future.delayed(Duration(seconds: 1)); // 何らかの処理（遅延）をシミュレート
  sharedData.value++; // 共有データをカウントアップ
  print('Current value: ${sharedData.value}');
}

void main() async {
  final sharedData = SharedData();

  // 複数の非同期タスクを同時に実行し、共有データをカウントアップする
  await Future.wait([
    asyncIncrement(sharedData),
    asyncIncrement(sharedData),
    asyncIncrement(sharedData)
  ]);

  print('Final value: ${sharedData.value}');
}
```

このコードでは、`asyncIncrement` 関数は共有データオブジェクト `SharedData` の `value` を非同期的にインクリメントします。`Future.wait` は、すべての非同期処理が完了するのを待ちます。Dartの非同期モデルにより、これらの処理は順番に実行され、共有データへのアクセスは排他的に行われます。そのため、最終的な値は予想通りにインクリメントされます。

ただし、外部API呼び出しなど、外部の非同期処理を含む場合は、処理の順序が保証されないことに注意が必要です。このような場合は、排他制御のために追加のロジック（例えば、ロックメカニズムやキューを使用する）が必要になることがあります。