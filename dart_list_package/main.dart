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
