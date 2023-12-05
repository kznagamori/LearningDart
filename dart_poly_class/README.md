# クラスのインタフェースを使用したポリモーフィズムの実現

Dartでクラスのインタフェースを使用してポリモーフィズムを実現するサンプルプログラムを以下に示します。この例では、`Drawable` インタフェースと、そのインタフェースを実装するいくつかのクラス（ `Circle` 、`Rectangle` ）を定義し、それぞれのクラスで特定の描画方法を実装します。

## Drawableインタフェースの定義
`Drawable` インタフェースには、`draw` メソッドのシグネチャを定義します。
```dart
abstract class Drawable {
  void draw();
}
```

このインタフェースは、実装するすべてのクラスに `draw` メソッドの実装を強制します。

## インタフェースを実装するクラス
`Drawable` インタフェースを実装する `Circle` と `Rectangle` クラスを定義します。
```dart
class Circle implements Drawable {
  @override
  void draw() {
    print("Drawing a circle.");
  }
}

class Rectangle implements Drawable {
  @override
  void draw() {
    print("Drawing a rectangle.");
  }
}
```

これらのクラスは `Drawable` インタフェースを実装し、`draw` メソッドをオーバーライドして、それぞれの図形の描画方法を提供します。

## メインプログラム
`main.dart` では、異なる `Drawable` オブジェクトを作成し、それらを通じてポリモーフィズムを実現します。
```dart
void main() {
  List<Drawable> figures = [Circle(), Rectangle()];

  for (var figure in figures) {
    figure.draw();
  }
}
```

このプログラムでは、`Drawable` 型のリストに `Circle` と `Rectangle` オブジェクトを追加し、各オブジェクトの `draw` メソッドを呼び出しています。これにより、異なる型のオブジェクトで共通のインタフェースを使用するポリモーフィズムを実現しています。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。
```bash
dart run main.dart
```
実行すると、`Circle` と `Rectangle` オブジェクトの `draw` メソッドが呼び出され、それぞれの図形が描画されることがコンソールに出力されます。この例では、Dartでのインタフェースの使用とポリモーフィズムの実現方法を示しています。


