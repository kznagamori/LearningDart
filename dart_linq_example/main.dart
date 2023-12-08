void main() {
  List<int> numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  // 偶数のみ抽出
  Iterable<int> evenNumbers = numbers.where((number) => number.isEven);
  print(evenNumbers); // (10, 8, 6, 4, 2)

  // 各要素を二乗
  Iterable<int> squaredNumbers = numbers.map((number) => number * number);
  print(squaredNumbers); // (100, 81, 64, 49, 36, 25, 16, 9, 4, 1)

  // 昇順にソート
  numbers.sort();
  print(numbers); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  // 偶数のみ抽出して、それぞれを二乗
  var evenSquared = numbers.where((n) => n.isEven).map((n) => n * n);
  print(evenSquared); // (4, 16, 36, 64, 100)
}
