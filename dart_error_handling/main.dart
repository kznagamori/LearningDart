void generateError(int value) {
  if (value == 0) {
    throw Exception('Value cannot be zero.');
  }
  print('Value is $value');
}

void main() {
  try {
    generateError(0); // エラーを発生させる
  } catch (e) {
    print('Caught an error: $e');
  }

  try {
    generateError(5); // エラーが発生しない
  } catch (e) {
    print('Caught an error: $e');
  }
}
