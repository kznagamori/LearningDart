class Vehicle {
  int maxSpeed;

  Vehicle(this.maxSpeed);

  void showSpeed() {
    print("Maximum speed: $maxSpeed km/h");
  }
}

class Car extends Vehicle {
  String model;

  Car(this.model, int maxSpeed) : super(maxSpeed);

  @override
  void showSpeed() {
    print("$model's maximum speed: $maxSpeed km/h");
  }
}

void main() {
  var myCar = Car("Toyota", 180);
  myCar.showSpeed();
}
