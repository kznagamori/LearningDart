void quickSort(List<int> list, int left, int right) {
  if (left < right) {
    int pivotIndex = _partition(list, left, right);
    quickSort(list, left, pivotIndex - 1); // 左のサブリストをソート
    quickSort(list, pivotIndex + 1, right); // 右のサブリストをソート
  }
}

int _partition(List<int> list, int left, int right) {
  int pivot = list[right]; // ピボットとしてリストの最後の要素を使用
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
