# クイックソート

Dartでクイックソートアルゴリズムを実装するためのサンプルプログラムを以下に示します。クイックソートは分割統治法を用いた高速なソートアルゴリズムで、平均計算時間は `O(n log n)` です。このアルゴリズムは、リストをピボットを基準にして分割し、それぞれのサブリストを再帰的にソートします。

## サンプルプログラム
```dart
void quickSort(List<int> list, int left, int right) {
  if (left < right) {
    int pivotIndex = _partition(list, left, right);
    quickSort(list, left, pivotIndex - 1);  // 左のサブリストをソート
    quickSort(list, pivotIndex + 1, right); // 右のサブリストをソート
  }
}

int _partition(List<int> list, int left, int right) {
  int pivot = list[right];  // ピボットとしてリストの最後の要素を使用
  int i = left - 1;

  for (int j = left; j < right; j++) {
    if (list[j] < pivot) {
      i++;
      _swap(list, i, j);
    }
  }

  _swap(list, i + 1, right);
  return i + 1;
}

void _swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void main() {
  List<int> numbers = [10, 7, 8, 9, 1, 5];
  print('元のリスト: $numbers');

  quickSort(numbers, 0, numbers.length - 1);
  print('ソート後のリスト: $numbers');
}
```

このプログラムでは、`quickSort` 関数がクイックソートのメインロジックを実行し、`_partition` 関数がピボットを基準にリストを分割します。_swap 関数はリスト内の要素を交換するために使用されます。

`main` 関数では、整数のリストを定義し、`quickSort` 関数を使用してそれをソートします。ソート前とソート後のリストが出力され、アルゴリズムの動作を確認できます。
