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
