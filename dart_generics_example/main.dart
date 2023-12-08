class Box<T> {
  T contents;
  Box(this.contents);

  T open() {
    return contents;
  }
}

T getFirst<T>(List<T> list) {
  if (list.isNotEmpty) {
    return list.first;
  } else {
    throw Exception('List is empty');
  }
}

void main() {
  // ジェネリッククラスの使用
  var stringBox = Box<String>('hello');
  print(stringBox.open()); // "hello"

  var intBox = Box<int>(123);
  print(intBox.open()); // 123

  // ジェネリックメソッドの使用
  var numbers = [1, 2, 3];
  print(getFirst(numbers)); // 1

  var words = ['dart', 'flutter'];
  print(getFirst(words)); // "dart"
}
