class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print("Hello, I'm $name and I'm $age years old.");
  }
}

void main() {
  var alice = Person("Alice", 30);
  alice.introduce();

  var bob = Person("Bob", 25);
  bob.introduce();
}
