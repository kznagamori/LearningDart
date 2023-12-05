# 一般的なエラー処理

Dartで一般的なエラー処理を行うサンプルプログラムを以下に示します。この例では、関数内でエラー（例外）を発生させ、呼び出し側でそのエラーを捕捉し処理する方法を示します。

## 関数でのエラー発生
`generateError` 関数では、特定の条件下（この例では引数が0）でエラー（ `Exception` ）を発生させます。

```dart
void generateError(int value) {
  if (value == 0) {
    throw Exception('Value cannot be zero.');
  }
  print('Value is $value');
}
```

この関数は引数 `value` が0の場合、`Exception`を発生させます。そうでない場合は値を単に出力します。

## エラー処理の実装
メインプログラムでは `try-catch` ブロックを使用して、`generateError` 関数から発生するエラーを捕捉し、適切に処理します。

```dart
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
```

このプログラムでは、最初に `generateError` を0で呼び出し、エラーを発生させます。 `try-catch` ブロックがエラーを捕捉し、エラーメッセージを出力します。次に、エラーが発生しないように `generateError` を5で呼び出します。

## 実行方法
このプログラムを実行するには、上記のコードを `main.dart` ファイルに保存し、コマンドラインで以下のコマンドを実行します。
```bash
dart run main.dart
```
実行すると、最初の呼び出しでエラーが捕捉され、エラーメッセージが表示されます。次の呼び出しではエラーが発生せず、正常に値が出力されます。この例では、Dartでの一般的なエラー処理の方法、特に `try-catch` ブロックの使用方法を示しています。
