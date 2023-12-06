class Queue<T> {
  final List<T> _list = [];

  // キューに要素を追加
  void enqueue(T element) {
    _list.add(element);
  }

  // キューから要素を削除して返す
  T? dequeue() {
    if (_list.isNotEmpty) {
      return _list.removeAt(0);
    }
    return null; // キューが空の場合はnullを返す
  }

  // キューが空かどうかを確認
  bool get isEmpty => _list.isEmpty;

  // キューの先頭の要素を覗き見
  T? peek() => _list.isNotEmpty ? _list.first : null;

  @override
  String toString() => _list.toString();
}

void main() {
  var queue = Queue<int>();

  // 要素の追加
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print('キュー: $queue');

  // 要素の削除
  var dequeuedElement = queue.dequeue();
  print('削除された要素: $dequeuedElement');
  print('更新されたキュー: $queue');

  // 先頭の要素の覗き見
  var frontElement = queue.peek();
  print('先頭の要素: $frontElement');
}
