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
