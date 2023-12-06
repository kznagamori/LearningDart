# スタック構造

Dartでスタック構造を独自に実装するためのサンプルプログラムを以下に示します。スタックは後入れ先出し（ `LIFO: Last In, First Out` ）の原則に基づいて動作し、新しい要素はスタックのトップに追加され、要素はスタックのトップから削除されます。この実装では、ジェネリック型を使用し、リストを利用してスタック内の要素を管理します。

## サンプルプログラム
```dart
class Stack<T> {
  final List<T> _list = [];

  // スタックに要素を追加
  void push(T element) {
    _list.add(element);
  }

  // スタックから要素を削除して返す
  T? pop() {
    if (_list.isNotEmpty) {
      return _list.removeLast();
    }
    return null; // スタックが空の場合はnullを返す
  }

  // スタックが空かどうかを確認
  bool get isEmpty => _list.isEmpty;

  // スタックのトップの要素を覗き見
  T? peek() => _list.isNotEmpty ? _list.last : null;

  @override
  String toString() => _list.toString();
}

void main() {
  var stack = Stack<int>();

  // 要素の追加
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print('スタック: $stack');

  // 要素の削除
  var poppedElement = stack.pop();
  print('削除された要素: $poppedElement');
  print('更新されたスタック: $stack');

  // トップの要素の覗き見
  var topElement = stack.peek();
  print('トップの要素: $topElement');
}
```

このプログラムでは、`Stack<T>` クラスを定義しています。このクラスはジェネリック型Tを使用しており、任意の型の要素を格納できます。`push` メソッドで要素をスタックのトップに追加し、`pop` メソッドでスタックのトップから要素を削除します。また、`peek` メソッドを使用してスタックのトップの要素を覗き見ることができます。`main` 関数では、`Stack<int>` のインスタンスを作成し、要素の追加、削除、覗き見を行っています。
