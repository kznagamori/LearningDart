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
