# クラスの継承を実現する

Dartでクラスの継承を実現するサンプルプログラムを以下に示します。この例では、基底クラス（ `Vehicle` ）とその派生クラス（ `Car` ）を定義し、継承の概念を示します。

## 基底クラスの定義
基底クラス `Vehicle` は、一般的な乗り物の特性（例えば、最大速度）を持ちます。
```dart
class Vehicle {
  int maxSpeed;

  Vehicle(this.maxSpeed);

  void showSpeed() {
    print("Maximum speed: $maxSpeed km/h");
  }
}
```
この `Vehicle` クラスは、最大速度を保持し、それを表示する基本的な機能を提供します。

## 派生クラスの定義
`Car` クラスは `Vehicle` クラスを継承し、追加の特性（例えば、モデル名）を持ちます。
```dart
class Car extends Vehicle {
  String model;

  Car(this.model, int maxSpeed) : super(maxSpeed);

  @override
  void showSpeed() {
    print("$model's maximum speed: $maxSpeed km/h");
  }
}
```
`Car` クラスでは、コンストラクタでモデル名と最大速度を受け取り、基底クラスのコンストラクタを呼び出しています。また、`showSpeed` メソッドをオーバーライドして、モデル名を含む速度情報を表示します。

## メインプログラム
`main.dart` では、`Car` クラスのインスタンスを作成し、そのメソッドを呼び出します。
```dart
void main() {
  var myCar = Car("Toyota", 180);
  myCar.showSpeed();
}
```
このプログラムでは、Carオブジェクトを作成し、その `showSpeed` メソッドを呼び出して、車のモデル名と最大速度を表示します。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。
```bash
dart run main.dart
```

実行すると、`Car` オブジェクトのモデル名と最大速度がコンソールに出力されます。この例では、Dartでのクラス継承、コンストラクタの使用、メソッドのオーバーライドの基本的な方法を示しています。



