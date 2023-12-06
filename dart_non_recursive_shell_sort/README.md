# 再帰を使用しないシェルソート

Dartで再帰を使用しないシェルソートを実装するサンプルプログラムを以下に示します。シェルソートは挿入ソートの一般化であり、ソートする要素の間隔を徐々に狭めながらソートを行います。このアルゴリズムは、特に部分的にソートされたリストで効率的です。

## サンプルプログラム
```dart
void shellSort(List<int> list) {
  int n = list.length;
  // ギャップを減少させながら挿入ソートを適用
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = list[i];
      int j;
      for (j = i; j >= gap && list[j - gap] > temp; j -= gap) {
        list[j] = list[j - gap];
      }
      list[j] = temp;
    }
  }
}

void main() {
  List<int> numbers = [23, 29, 15, 19, 31, 7, 9, 5, 2];
  print('元のリスト: $numbers');

  shellSort(numbers);
  print('ソート後のリスト: $numbers');
}
```

このプログラムでは、`shellSort` 関数がシェルソートのロジックを実行します。最初に、リストの長さの半分を最初のギャップ（間隔）として設定し、そのギャップで挿入ソートを適用します。その後、ギャップを徐々に狭めてソートを続けます。

`main` 関数では、整数のリストを定義し、`shellSort` 関数を使用してそれをソートします。ソート前とソート後のリストが出力され、アルゴリズムの動作を確認できます。
