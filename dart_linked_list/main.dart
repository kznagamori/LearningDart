void main() {
  // リンクドリストの初期化
  LinkedList myList = LinkedList();

  // ノードの追加
  myList.insert(1);
  myList.insert(2);
  myList.insert(3);

  // リストの内容を表示
  print("リンクドリスト:");
  myList.printList();

  // 特定の値を持つノードの削除
  myList.deleteWithValue(2);

  // 更新されたリストを表示
  print("更新されたリンクドリスト:");
  myList.printList();
}

class Node {
  int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;

  // 新しいノードをリストの先頭に挿入
  void insert(int value) {
    Node newNode = Node(value);
    newNode.next = head;
    head = newNode;
  }

  // リストから特定の値を持つノードを削除
  void deleteWithValue(int value) {
    if (head == null) return;

    if (head!.value == value) {
      head = head!.next;
      return;
    }

    Node? current = head;
    while (current!.next != null) {
      if (current.next!.value == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  // リストの内容を表示
  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}
