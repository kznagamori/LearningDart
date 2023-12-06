## リンクドリスト

Dart言語で `LinkedList` を使用するための実行可能なサンプルプログラムを作成します。Dartには標準の `LinkedList` クラスが含まれており、これを利用してリンクドリストの操作を行います。

以下のサンプルでは、リンクドリストを作成し、要素を追加、表示、削除する基本的な操作を行います。

## サンプルプログラム
```dart
import 'dart:collection';

final class ListNode<E> extends LinkedListEntry<ListNode<E>> {
  E value;

  ListNode(this.value);

  @override
  String toString() => 'ListNode($value)';
}

void main() {
  // LinkedListのインスタンスを作成
  var linkedList = LinkedList<ListNode<int>>();

  // 要素を追加
  linkedList.add(ListNode<int>(1));
  linkedList.add(ListNode<int>(2));
  linkedList.add(ListNode<int>(3));

  // リンクドリストの内容を表示
  print('リンクドリストの内容:');
  for (var node in linkedList) {
    print(node.value);
  }

  // 最初の要素を削除
  linkedList.first.unlink();

  // 要素を再表示
  print('最初の要素を削除した後のリンクドリスト:');
  for (var node in linkedList) {
    print(node.value);
  }
}
```

このコードは以下の手順で動作します：

1. Dartの`dart:collection` ライブラリから `LinkedList` と `LinkedListEntry` をインポートします。
2. ジェネリック型Eを持つ `ListNode` クラスを定義し、`LinkedListEntry` を拡張します。このクラスはリンクドリストに格納される個々のノードを表します。
3. `main` 関数内で、整数型（ `int` ）の要素を持つ `LinkedList` のインスタンスを作成します。
4. 新しい `ListNode<int>` インスタンスを作成し、リンクドリストに追加します。
5. `for` ループを使用してリンクドリストの内容を表示します。
6. リンクドリストの最初の要素を削除します。
7. 最後に、更新されたリンクドリストの内容を再度表示します。

このサンプルコードを実行するには、Dartがインストールされている環境が必要です。プログラムを実行すると、リンクドリストに要素が追加された後、最初の要素が削除され、その後のリンクドリストの状態が表示されます。
