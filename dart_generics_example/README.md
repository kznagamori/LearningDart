# ジェネリック機能

Dartにおいて、ジェネリック（またはテンプレートとも呼ばれる）は、クラスやメソッドに対して型を柔軟に指定するために使用されます。以下に、ジェネリックを使用したクラスとメソッドの定義、およびその使用方法を示すサンプルプログラムを紹介します。

## ジェネリックを使用したクラスの定義
ジェネリックを使用して、異なるデータ型を格納できるシンプルなボックスクラスを定義します。

```dart
class Box<T> {
  T contents;
  Box(this.contents);

  T open() {
    return contents;
  }
}
```

この `Box` クラスは、任意の型 `T` の `contents` を保持し、それを返すopenメソッドを持っています。

## ジェネリックを使用したメソッドの定義
ジェネリックを使用して、任意の型のリストから最初の要素を返すメソッドを定義します。

```dart
T getFirst<T>(List<T> list) {
  if (list.isNotEmpty) {
    return list.first;
  } else {
    throw Exception('List is empty');
  }
}
```

この `getFirst` メソッドは、ジェネリック型 `T` のリストを受け取り、その最初の要素を返します。

## ジェネリックの使用例
上記で定義したジェネリッククラスとメソッドを使用する例です。

```dart
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
```

このプログラムでは、`String` と `int` 型の `Box` オブジェクトを作成し、それらから内容物を取り出しています。また、`int` と `String` 型のリストに対して `getFirst` メソッドを使用し、それぞれのリストの最初の要素を取得しています。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。

```bash
dart run main.dart
```
実行すると、ジェネリッククラスとメソッドを通じて取得した値がコンソールに出力されます。この例では、Dartにおけるジェネリックの基本的な使用方法を示しています。