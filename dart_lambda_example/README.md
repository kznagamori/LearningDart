# ラムダ式

Dartでは、ラムダ式（またはアロー関数とも呼ばれる）を使用して、コードをより簡潔に記述することができます。ラムダ式は主に短い関数やメソッドの本体を表現するのに使われます。以下に、Dartでラムダ式を使用するいくつかのサンプルプログラムを示します。

## リストの各要素に対する操作
リストの各要素を処理する際にラムダ式を使用します。
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // 各要素を二乗
  var squaredNumbers = numbers.map((n) => n * n);
  print(squaredNumbers.toList()); // [1, 4, 9, 16, 25]

  // 偶数のみ抽出
  var evenNumbers = numbers.where((n) => n.isEven);
  print(evenNumbers.toList()); // [2, 4]
}
```

## 単一の引数を取るラムダ式
単一の引数を取る簡単なラムダ式の例です。
```dart
void main() {
  // 単一の引数を二乗するラムダ式
  var square = (int n) => n * n;
  print(square(4)); // 16
}
```

## 複数の引数を取るラムダ式
複数の引数を取るラムダ式の例です。
```dart
void main() {
  // 二つの数の合計を計算するラムダ式
  var add = (int a, int b) => a + b;
  print(add(5, 3)); // 8
}
```

## ラムダ式を引数として渡す
関数やメソッドにラムダ式を引数として渡す例です。
```dart
void executeOperation(int a, int b, Function(int, int) operation) {
  var result = operation(a, b);
  print(result);
}

void main() {
  // ラムダ式を引数として渡す
  executeOperation(4, 2, (a, b) => a * b); // 8
  executeOperation(6, 3, (a, b) => a - b); // 3
}
```

これらの例では、ラムダ式を使用して関数の本体を簡潔に記述し、コードの可読性を高めています。Dartでは、このようなラムダ式を多用してコードをシンプルに保つことが一般的です。

