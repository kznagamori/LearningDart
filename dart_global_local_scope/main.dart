import 'file1.dart';

void main() {
  // file1.dartのfileScopedVariableとfileScopedFunctionは参照できない
  //print(fileScopedVariable);
  //print(fileScopedFunction());

  // file1.dartのglobalScopedVariableとglobalScopedFunctionを使用
  print(globalScopedVariable);
  print(globalScopedFunction());
}
