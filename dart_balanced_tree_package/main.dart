import 'dart:collection';

void main() {
  // SplayTreeSetのインスタンスを作成
  var splayTreeSet = SplayTreeSet<int>();

  // 要素を追加
  splayTreeSet.add(5);
  splayTreeSet.add(3);
  splayTreeSet.add(9);
  splayTreeSet.add(1);
  splayTreeSet.add(7);

  // セットの内容を表示
  print('SplayTreeSetの内容: $splayTreeSet');

  // 要素の検索
  if (splayTreeSet.contains(3)) {
    print('SplayTreeSetには3が含まれています。');
  } else {
    print('SplayTreeSetには3が含まれていません。');
  }

  // 要素の削除
  splayTreeSet.remove(5);
  print('5を削除した後のSplayTreeSet: $splayTreeSet');
}
