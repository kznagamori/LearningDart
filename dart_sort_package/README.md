# ソート
Dartの標準ライブラリでは、リストのソートに関していくつかの便利なメソッドを提供しています。特定のソートパッケージを使用する必要はなく、Listクラスのsortメソッドを使用して簡単にリストをソートすることができます。

## サンプルプログラム

以下は、Dartでリストをソートする実行可能なサンプルプログラムです。この例では、整数のリストとカスタムオブジェクトのリストの両方をソートします。

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => '$name: $age';
}

void main() {
  //整数リストのソート
  var numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];

  // リストをソート
  numbers.sort();

  print('ソートされた数値リスト: $numbers');

  //カスタムオブジェクトのリストのソート
  var people = [Person('Alice', 30), Person('Bob', 25), Person('Charlie', 35)];

  // カスタム比較関数を使用してリストをソート
  people.sort((a, b) => a.age.compareTo(b.age));

  print('年齢でソートされた人物リスト:');
  people.forEach((person) => print(person));
}
```

このプログラムは、整数のリストを昇順でソートします。
また、`Person` オブジェクトのリストを年齢で昇順にソートします。
カスタムオブジェクトを含むリストをソートする場合、比較関数を `sort` メソッドに提供する必要があります。

これらの例はDartの標準機能を使用しており、追加のパッケージは必要ありません。`sort` メソッドは非常に汎用的で、カスタム比較関数を提供することでさまざまなデータ型のリストを簡単にソートできます。
