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

void main() {
  var myCar = Car("Toyota", 2010);
  myCar.showDetails(); // パブリックメソッドの呼び出し
  myCar.showAge(); // プライベートメソッドを間接的に呼び出し
}
