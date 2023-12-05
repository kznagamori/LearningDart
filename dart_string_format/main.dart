void main() {
  // 整数型のフォーマット
  int number = 255;
  print(
      "10進数: ${number.toRadixString(10)}, 2進数: ${number.toRadixString(2)}, 8進数: ${number.toRadixString(8)}, 16進数: ${number.toRadixString(16)}");
  print("整数: ${number}, 0パディング: ${number.toString().padLeft(8, '0')}");

  // 浮動小数点型のフォーマット
  double pi = 3.14159;
  print("浮動小数点: ${pi}, 科学技術記法: ${pi.toStringAsExponential(2)}");
  print("浮動小数点: 小数点以下2桁: ${pi.toStringAsFixed(2)}");

  // 文字列型のフォーマット
  String text = "Hello Dart";
  print("文字列: 右詰め: ${text.padRight(20, '-')} 左詰め: ${text.padLeft(20, '-')}");
}
