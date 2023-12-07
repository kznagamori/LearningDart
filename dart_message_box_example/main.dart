import 'dart:async';
import 'dart:isolate';

// エントリポイント関数の型を定義する型エイリアス。
typedef Entrypoint = void Function(SendPort sendPort);

// Isolateを管理するクラス。
class IsolateManager {
  // Isolateの終了を待機するためのCompleter。
  final Completer<void> _completer = Completer<void>();
  final Entrypoint entrypoint;
  late final ReceivePort receivePort = ReceivePort();
  late final ReceivePort onExit;

  // コンストラクタでエントリポイント関数を受け取り、新しいIsolateを生成。
  IsolateManager(this.entrypoint) {
    onExit = ReceivePort();
    // 新しいIsolateを生成し、終了時にCompleterを完了させる。
    Isolate.spawn(entrypoint, receivePort.sendPort, onExit: onExit.sendPort)
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
    receivePort.close();
  }
}

class MessagePort<T> {
  SendPort sendPort;
  ReceivePort receivePort;
  Stream broadcastStream;
  MessagePort(this.sendPort, this.receivePort, this.broadcastStream);

  void send(T message) {
    sendPort.send(message);
  }

  Future<T> received(int timeoutMilliseconds) async {
    var completer = Completer<T>();
    var timer = Timer(Duration(milliseconds: timeoutMilliseconds), () {
      if (!completer.isCompleted) {
        completer.completeError(TimeoutException(
            'Timeout after $timeoutMilliseconds milliseconds'));
      }
    });
    broadcastStream.listen((dynamic message) {
      if (!completer.isCompleted) {
        timer.cancel();
        completer.complete(message as T);
      }
    });
    return completer.future;
  }

  void close() {
    receivePort.close();
  }
}

class MessageBoxMaster<T> {
  static final MessageBoxMaster _instance = MessageBoxMaster._internal();
  Map<IsolateManager, MessagePort> _slavePorts = {};
  MessageBoxMaster._internal();

  static MessageBoxMaster get instance => _instance;

  Future<void> init(IsolateManager mng) async {
    // ブロードキャストストリームに変換
    Stream broadcastStream = mng.receivePort.asBroadcastStream();

    // MassageBoxSlaveのReceivePortのSendPortを受け取る。
    SendPort sendPort = await broadcastStream.first as SendPort;

    // MassageBoxMasterのReceivePortのsendPortを渡す。
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    // MassageBoxSlaveから'ready'を受け取る。
    var ready = await broadcastStream.first;
    if (ready != 'ready') {
      throw Exception('Isolate is not ready');
    }
    _slavePorts[mng] =
        MessagePort(sendPort, receivePort, receivePort.asBroadcastStream());
  }

  void send(IsolateManager mng, T message) {
    _slavePorts[mng]?.send(message);
  }

  void sendBroadcast(T message) {
    _slavePorts.forEach((key, value) {
      value.send(message);
    });
  }

  Future<T> received(IsolateManager mng, int timeoutMilliseconds) async {
    return await _slavePorts[mng]?.received(timeoutMilliseconds);
  }

  void close() {
    _slavePorts.forEach((key, value) {
      value.close();
    });
  }
}

class MessageBoxSlave<T> {
  final SendPort _msgPort;
  late final MessagePort _masterPort;

  MessageBoxSlave(this._msgPort);

  Future<void> init() async {
    ReceivePort receivePort = ReceivePort();
    Stream broadcastStream = receivePort.asBroadcastStream();
    _msgPort.send(receivePort.sendPort);
    SendPort sendPort = await broadcastStream.first as SendPort;
    _msgPort.send('ready');
    _masterPort = MessagePort(sendPort, receivePort, broadcastStream);
  }

  void send(T message) {
    _masterPort.send(message);
  }

  Future<T> received(int timeoutMilliseconds) async {
    return await _masterPort.received(timeoutMilliseconds);
  }

  void close() {
    _masterPort.close();
  }
}

// 最初のIsolateのエントリポイント関数。
Future<void> isolateFunc1(SendPort msgPort) async {
  var msgBox = MessageBoxSlave(msgPort);
  await msgBox.init();

  await Future.delayed(const Duration(seconds: 3));
  print('isolateFunc1');
  // ここでIsolateの処理を実装。
  for (int i = 0; i < 2; ++i) {
    String message;
    while (true) {
      try {
        message = await msgBox.received(1000);
        break;
      } catch (e) {
        print(e);
      }
    }
    print('${i}: isolateFunc1: $message');
    msgBox.send('${i}: to main from isolateFunc1');
  }
  msgBox.close();
}

// 2番目のIsolateのエントリポイント関数。
Future<void> isolateFunc2(SendPort msgPort) async {
  var msgBox = MessageBoxSlave(msgPort);
  await msgBox.init();

  await Future.delayed(const Duration(seconds: 1));
  print('isolateFunc2');
  // ここでIsolateの処理を実装。
  for (int i = 0; i < 2; ++i) {
    String message;
    while (true) {
      try {
        message = await msgBox.received(1000);
        break;
      } catch (e) {
        print(e);
      }
    }
    print('${i}: isolateFunc2: $message');
    msgBox.send('${i}: to main from isolateFunc2');
  }
  msgBox.close();
}

// main関数。
Future<void> main() async {
  // IsolateManagerのインスタンスを作成。
  List<IsolateManager> isolateManagers = [
    IsolateManager(isolateFunc1),
    IsolateManager(isolateFunc2)
  ];
  MessageBoxMaster msgBox = MessageBoxMaster.instance;
  for (var manager in isolateManagers) {
    await msgBox.init(manager);
  }
  await Future.delayed(const Duration(seconds: 3));

  for (int j = 0; j < 2; ++j) {
    print('${j}: Send message to isolateFunc1 and isolateFunc2');
    for (int i = 0; i < isolateManagers.length; i++) {
      msgBox.send(isolateManagers[i], '${j}: to isolateFunc${i + 1} from main');
    }

    for (int i = 0; i < isolateManagers.length; i++) {
      while (true) {
        try {
          var msg = await msgBox.received(isolateManagers[i], 1000);
          print(msg);
          break;
        } catch (e) {
          print(e);
        }
      }
    }
  }

  // すべてのIsolateの終了を待つ。
  await Future.wait([isolateManagers[0].join(), isolateManagers[1].join()]);

  // すべてのIsolateが終了したことを出力。
  print('All Isolates have completed');

  msgBox.close();
  // 各IsolateManagerのリソースを解放。
  isolateManagers.forEach((manager) {
    manager.close();
  });
}
