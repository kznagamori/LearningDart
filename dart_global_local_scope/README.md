# ファイル内グローバル変数と関数、ファイル外グローバル変数と関数

グローバル変数と関数は、そのスコープ（可視性範囲）に基づいて、ファイル内グローバル（同一ファイル内でのみアクセス可能）またはファイル外グローバル（他のファイルからもアクセス可能）として定義されます。

## ファイル内グローバル変数と関数
ファイル内グローバル変数や関数は、その定義を含むファイル内でのみアクセス可能です。これらは通常、<strong>`_`</strong>で始まる名前を使って定義されます。

### file1.dart
```dart
// ファイル内グローバル変数
String _fileScopedVariable = "私はfile1.dart内でのみアクセス可能です";

// ファイル内グローバル関数
String _fileScopedFunction() {
  return "この関数はfile1.dart内でのみ呼び出せます";
}
```

## ファイル外グローバル変数と関数
ファイル外グローバル変数や関数は、他のファイルからもアクセス可能です。これらは<st<strong>`_`</strong>以外でで始まる名前を使って定義されます。

### file1.dart
```dart
// ファイル外グローバル変数
String globalScopedVariable = "私はどのファイルからでもアクセス可能です";

// ファイル外グローバル関数
String globalScopedFunction() {
  return "この関数はどのファイルからでも呼び出せます";
}
```

### main.dart
```dart
import 'file1.dart';

void main() {
  // file1.dartのfileScopedVariableとfileScopedFunctionは参照できない
  //print(fileScopedVariable);
  //print(fileScopedFunction());

  // file1.dartのglobalScopedVariableとglobalScopedFunctionを使用
  print(globalScopedVariable);
  print(globalScopedFunction());
}
```

この例では、`file1.dart` に定義された `globalScopedVariable`と`globalScopedFunction` は、別のファイル（main.dart）からアクセスできます。  
これに対して、`fileScopedVariable` と `fileScopedFunction` は`file1.dart` 内でのみアクセス可能です。

Dartにおいては、名前が <strong>`_`</strong> 以外で始まる変数や関数は公開（エクスポートされる）され、他のファイルからアクセス可能です。一方、<strong>`_`</strong>で始まる名前は非公開であり、定義されたファイル内でのみアクセス可能です。