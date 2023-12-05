abstract class Drawable {
  void draw();
}

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

void main() {
  List<Drawable> figures = [Circle(), Rectangle()];

  for (var figure in figures) {
    figure.draw();
  }
}
