# キュー構造

Dartでキュー構造を独自に実装するためのサンプルプログラムを以下に示します。この実装では、簡単なキューのクラスを作成し、その中でリストを使用して要素を管理します。キューは先入れ先出し（ `FIFO: First In, First Out` ）の原則に基づいて動作します。

## サンプルプログラム
```dart
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
```

このプログラムでは、`Queue<T>` クラスを定義しています。このクラスはジェネリック型Tを使用しており、任意の型の要素を格納できます。`enqueue` メソッドで要素をキューの末尾に追加し、`dequeue` メソッドでキューの先頭から要素を削除します。また、`peek` メソッドを使用してキューの先頭の要素を覗き見ることができます。`main` 関数では、`Queue<int>` のインスタンスを作成し、要素の追加、削除、覗き見を行っています。
