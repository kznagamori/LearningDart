# C#みたいなLINQ機能

Dartには `C#` の `LINQ（Language Integrated Query）` と同等の機能を直接提供するものはありませんが、Dartの `Iterable` クラスには、フィルタリング、マッピング、ソートなどの処理を行うためのメソッドが多数用意されています。これらのメソッドを使用して、`LINQ` に似た操作を行うことができます。

以下に、Dartでこれらのメソッドを使用して、リスト内のデータを処理するサンプルプログラムを示します。

## データフィルタリング（where）
```dart
  List<int> numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  // 偶数のみ抽出
  Iterable<int> evenNumbers = numbers.where((number) => number.isEven);
  print(evenNumbers); // (2, 4, 6, 8, 10)
```

## データ変換（マッピング）（map）
```dart
  List<int> numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];


  // 各要素を二乗
  Iterable<int> squaredNumbers = numbers.map((number) => number * number);
  print(squaredNumbers); // (1, 4, 9, 16, 25)
```

## データソート（sort）
```dart
  List<int> numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  // 昇順にソート
  numbers.sort();
  print(numbers); // [1, 2, 3, 4, 5]
```

## 複合クエリ
```dart
  List<int> numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  // 偶数のみ抽出して、それぞれを二乗
  var evenSquared = numbers.where((n) => n.isEven).map((n) => n * n);
  print(evenSquared); // (4, 16, 36, 64, 100)
```

これらの例では、Dartのリスト操作メソッドを使用して、`C#` の `LINQ` に似たデータ操作を行っています。これにより、フィルタリング、マッピング、ソートなどの操作が可能です。