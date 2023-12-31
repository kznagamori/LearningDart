# パブリックなクラスのメンバ、メソッドを定義とプライベートなクラスのメンバ、メソッドを定義する

Dartでパブリックなクラスのメンバおよびメソッドとプライベートなクラスのメンバおよびメソッドを定義するサンプルプログラムを以下に示します。

## パブリックなクラスの定義
パブリックなクラス `Car` を定義し、パブリックなメンバ（変数とメソッド）を含めます。

```dart
class Car {
  String model; // パブリックなメンバ変数
  int _year; // プライベートなメンバ変数

  Car(this.model, this._year);

  // パブリックなメソッド
  void showDetails() {
    print('Car model: $model, Year: $_year');
  }

  // プライベートなメソッド
  void _displayAge() {
    int age = DateTime.now().year - _year;
    print('Car age: $age years');
  }

  // プライベートメソッドを呼び出すパブリックメソッド
  void showAge() {
    _displayAge();
  }
}
```

このクラスでは、`model` はパブリックなメンバ変数であり、外部から直接アクセス可能です。一方で `_year` と` _displayAge()` はプライベートなメンバ変数とメソッドであり、クラスの外部からは直接アクセスできません。

## メインプログラム
`main.dart` では、`Car` クラスのインスタンスを作成し、そのパブリックなメソッドを呼び出します。

```dart
void main() {
  var myCar = Car("Toyota", 2010);
  myCar.showDetails(); // パブリックメソッドの呼び出し
  myCar.showAge(); // プライベートメソッドを間接的に呼び出し
}
```

このプログラムでは、`Car` オブジェクトの詳細を表示し、車の年齢を間接的に表示します。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。
```bash
dart run main.dart
```
実行すると、`Car` オブジェクトの詳細と年齢がコンソールに出力されます。この例では、Dartでのパブリックなメンバおよびメソッドとプライベートなメンバおよびメソッドの定義と使用方法を示しています。

