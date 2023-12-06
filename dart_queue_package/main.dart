import 'dart:collection';

void main() {
  // Queueのインスタンスを作成
  var queue = Queue<int>();

  // 要素を追加
  queue.add(1);
  queue.add(2);
  queue.add(3);

  // キューの内容を表示
  print('キューの内容: $queue');

  // 最初の要素を取り出し
  var firstElement = queue.removeFirst();
  print('取り出された最初の要素: $firstElement');

  // 更新されたキューの内容を表示
  print('更新されたキューの内容: $queue');

  // 要素を更に追加
  queue.add(4);
  queue.add(5);

  // 最終的なキューの内容を表示
  print('最終的なキューの内容: $queue');
}
