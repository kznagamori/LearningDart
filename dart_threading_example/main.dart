import 'dart:async';
import 'dart:isolate';

void doWork(SendPort sendPort) {
  // 何らかの処理を行う
  var result = 'Isolateの処理結果';
  sendPort.send(result);
}

Future<String> doAsyncWork(int i) async {
  // 何らかの非同期処理を行う（例：ランダムな待機）
  await Future.delayed(Duration(seconds: i));
  return '非同期処理$i 完了';
}

void main() async {
  //　Isolatesを使用したスレッド処理
  var numberOfIsolates = 3;
  var allDone = Completer<void>(); // Completerのインスタンスを作成
  var completedIsolates = 0;
  var receivePort = ReceivePort();

  for (var i = 0; i < numberOfIsolates; i++) {
    // スレッド起動処理をawaitで待機
    await Isolate.spawn(doWork, receivePort.sendPort);
  }

  receivePort.listen((data) {
    print(data);
    completedIsolates++;
    if (completedIsolates == numberOfIsolates) {
      allDone.complete();
    }
  });

  await allDone.future;
  print('すべてのIsolateが完了しました。');
  receivePort.close();

  // Futureを使用した非同期処理
  var numberOfFutures = 3;
  var futures = <Future>[];

  for (var i = 0; i < numberOfFutures; i++) {
    futures.add(doAsyncWork(i));
  }

  var results = await Future.wait(futures);
  for (var result in results) {
    print(result);
  }

  print('すべての非同期処理が完了しました。');
}
