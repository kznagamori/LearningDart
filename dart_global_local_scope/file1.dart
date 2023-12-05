// ファイル内グローバル変数
String _fileScopedVariable = "私はfile1.dart内でのみアクセス可能です";

// ファイル内グローバル関数
String _fileScopedFunction() {
  return "この関数はfile1.dart内でのみ呼び出せます";
}

// ファイル外グローバル変数
String globalScopedVariable = "私はどのファイルからでもアクセス可能です";

// ファイル外グローバル関数
String globalScopedFunction() {
  return "この関数はどのファイルからでも呼び出せます";
}
