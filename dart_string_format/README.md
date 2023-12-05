# 各型のstring formatの組み合わせ
Dartでは、string formatは文字列操作で行う

## 各型のstring formatの組み合わせ

### 整数のフォーマット

**進数表示（16進数、2進数）**

```dart
int number = 255;
String hexString = number.toRadixString(16); // "ff"
String binaryString = number.toRadixString(2); // "11111111"
```

**0パディング**

```dart
int num = 42;
String paddedNum = num.toString().padLeft(5, '0'); // "00042"
```

### 浮動小数点数のフォーマット

**小数点以下の桁数制限**
```dart
double pi = 3.14159;
String formattedPi = pi.toStringAsFixed(2); // "3.14"
```

**科学技術記法**
```dart
double number = 12345.6789;
String scientificString = number.toStringAsExponential(2); // "1.23e+4"
```

### 文字列のフォーマット

**右詰め・左詰め**
```dart
String message = "Dart";
String rightPadded = message.padLeft(10, '-'); // "------Dart"
String leftPadded = message.padRight(10, '-'); // "Dart------"
```

これらのテクニックを組み合わせることで、Dartにおいて様々なデータ型を含む複雑な文字列を柔軟にフォーマットすることができます。

## サンプルプログラム
```dart
void main() {
  // 整数型のフォーマット
  int number = 255;
  print("10進数: ${number.toRadixString(10)}, 2進数: ${number.toRadixString(2)}, 8進数: ${number.toRadixString(8)}, 16進数: ${number.toRadixString(16)}");
  print("整数: ${number}, 0パディング: ${number.toString().padLeft(8, '0')}");

  // 浮動小数点型のフォーマット
  double pi = 3.14159;
  print("浮動小数点: ${pi}, 科学技術記法: ${pi.toStringAsExponential(2)}");
  print("浮動小数点: 小数点以下2桁: ${pi.toStringAsFixed(2)}");

  // 文字列型のフォーマット
  String text = "Hello Dart";
  print("文字列: 右詰め: ${text.padRight(20, '-')} 左詰め: ${text.padLeft(20, '-')}");
}
```


