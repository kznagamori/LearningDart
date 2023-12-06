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
