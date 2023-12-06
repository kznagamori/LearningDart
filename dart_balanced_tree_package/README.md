# 平衡二分木

`dart:collection` ライブラリに含まれる `SplayTreeSet` を使用することで、平衡二分木の機能を実現できます。`SplayTreeSet` はスプレイ木に基づいたセットの実装で、要素の挿入、検索、削除が効率的に行えます。

以下のサンプルプログラムでは、`SplayTreeSet` を使って整数のセットを作成し、要素を追加、検索、削除し、最後にセットの内容を表示する一連の操作を行います。


## サンプルプログラム
```dart
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
```

このプログラムは次のように動作します：

1. `SplayTreeSet<int>` のインスタンスを作成します。
2. `add` メソッドを使ってセットに整数の要素を追加します。
3. セットの内容を `print` 文を使用して表示します。
4. `contains` メソッドを使って特定の要素がセットに含まれているかどうかを確認します。
5. `remove` メソッドを使ってセットから要素を削除し、その後のセットの状態を表示します。

`SplayTreeSet` は要素を自動的にソートし、高速な検索操作を提供するため、データの順序を維持しながら高速な操作が必要な場合に適しています。このサンプルプログラムは、`SplayTreeSet`の基本的な使用方法を示しています。

