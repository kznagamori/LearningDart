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
