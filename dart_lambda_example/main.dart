void executeOperation(int a, int b, Function(int, int) operation) {
  var result = operation(a, b);
  print(result);
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // 各要素を二乗
  var squaredNumbers = numbers.map((n) => n * n);
  print(squaredNumbers.toList()); // [1, 4, 9, 16, 25]

  // 偶数のみ抽出
  var evenNumbers = numbers.where((n) => n.isEven);
  print(evenNumbers.toList()); // [2, 4]

  // 単一の引数を二乗するラムダ式
  var square = (int n) => n * n;
  print(square(4)); // 16

  // 二つの数の合計を計算するラムダ式
  var add = (int a, int b) => a + b;
  print(add(5, 3)); // 8

  // ラムダ式を引数として渡す
  executeOperation(4, 2, (a, b) => a * b); // 8
  executeOperation(6, 3, (a, b) => a - b); // 3
}
