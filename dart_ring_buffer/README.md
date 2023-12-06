# リングバッファ構造

Dartでリングバッファを実装し、データの追加に `push` メソッド、データの取得に `pop` メソッド、データの参照に `get` メソッドを使用するサンプルプログラムを以下に示します。この実装では、`push` メソッドで新しい要素を追加し、`pop` メソッドで最も古い要素を取り出し、`get` メソッドで特定の位置の要素を参照します。

## サンプルプログラム
```dart
class RingBuffer<T> {
  final List<T?> _buffer;
  int _head = 0;
  int _tail = 0;
  int _size = 0;
  final int capacity;

  RingBuffer(this.capacity) : _buffer = List.filled(capacity, null);

  void push(T value) {
    _buffer[_head] = value;
    _head = (_head + 1) % capacity;
    if (_size < capacity) {
      _size++;
    } else {
      _tail = (_tail + 1) % capacity;
    }
  }

  T? pop() {
    if (_size == 0) return null;

    T? value = _buffer[_tail];
    _buffer[_tail] = null;
    _tail = (_tail + 1) % capacity;
    _size--;
    return value;
  }

  T? get(int index) {
    if (index >= _size) return null;
    return _buffer[(_tail + index) % capacity];
  }

  @override
  String toString() {
    return _buffer.toString();
  }
}

void main() {
  var ringBuffer = RingBuffer<int>(3);

  ringBuffer.push(1);
  ringBuffer.push(2);
  ringBuffer.push(3);
  print('リングバッファ: $ringBuffer');

  print('参照（インデックス1）: ${ringBuffer.get(1)}');

  print('ポップ: ${ringBuffer.pop()}');
  print('ポップ後のバッファ: $ringBuffer');
  print('ポップ: ${ringBuffer.pop()}');
  print('ポップ後のバッファ: $ringBuffer');
  print('ポップ: ${ringBuffer.pop()}');
  print('ポップ後のバッファ: $ringBuffer');
}
```