# クラスのC#みたいなプロパティを定義、使用

Dartでは、C#のようなプロパティをゲッター（ `getter` ）とセッター（ `setter` ）を使って実現します。以下の例では、`Person` クラスに名前（ `_name` ）と年齢（ `_age` ）のプライベートフィールドを持たせ、それぞれに対するゲッターとセッターを定義します。

## Person クラスの定義
```dart
class Person {
  String _name;
  int _age;

  // 名前のゲッター
  String get name => _name;

  // 名前のセッター
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  // 年齢のゲッター
  int get age => _age;

  // 年齢のセッター
  set age(int newAge) {
    if (newAge >= 0) {
      _age = newAge;
    }
  }

  Person(this._name, this._age);
}
```
このクラスでは、`_name` と `_age` の両方に対して、値を取得するためのゲッターと値を設定するためのセッターが定義されています。これにより、値の設定に制約を加えることができます（例：名前が空文字列でない、年齢が負の数でないなど）。

## メインプログラム
`main.dart` では、`Person` クラスのインスタンスを作成し、プロパティを通じて値を設定および取得します。

```dart
void main() {
  var person = Person('Alice', 30);

  // ゲッターを使って値を取得
  print('Name: ${person.name}, Age: ${person.age}');

  // セッターを使って値を設定
  person.name = 'Bob';
  person.age = 25;

  // セッターを通じて設定された新しい値を表示
  print('New Name: ${person.name}, New Age: ${person.age}');
}
```
このプログラムでは、`Person` オブジェクトを作成し、初期値を設定した後、ゲッターを使って値を取得し、セッターを使って新しい値を設定しています。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。
```bash
dart run main.dart
```
実行すると、最初に設定された `Person` オブジェクトの名前と年齢が表示され、その後、新しい値がセッターを通じて設定され、更新された名前と年齢が表示されます。この例では、Dartでのプロパティの使用方法、特にゲッターとセッターの定義と使用方法を示しています。


