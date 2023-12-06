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
