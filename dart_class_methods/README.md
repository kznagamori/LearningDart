# クラスを使う

Dartでクラスを使用する基本的なサンプルプログラムを以下に示します。このプログラムでは、シンプルなPersonクラスを定義し、そのインスタンスを作成して操作します。

## Person クラスの定義
`Person` クラスは、名前（ `name` ）と年齢（ `age` ）をプロパティとして持ち、自己紹介を行うメソッド（ `introduce` ）を持っています。

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print("Hello, I'm $name and I'm $age years old.");
  }
}
```
このクラスでは、コンストラクタを使用してオブジェクトを初期化し、`introduce` メソッドを通じて自己紹介を行います。

## メインプログラム
`main.dart` では、`Person` クラスのインスタンスを作成し、そのメソッドを呼び出します。
```dart
void main() {
  var alice = Person("Alice", 30);
  alice.introduce();

  var bob = Person("Bob", 25);
  bob.introduce();
}
```

このプログラムでは、`Alice` と `Bob` という2人の `Person` オブジェクトを作成し、それぞれが自己紹介を行います。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。

```bash
dart run main.dart
```
実行すると、各 `Person` オブジェクトの自己紹介がコンソールに出力されます。この例では、Dartの基本的なクラスの使用方法、コンストラクタの定義、メソッドの呼び出しを示しています。
