# 二分木構造

Dartで二分木構造を実装するためのサンプルプログラムを以下に示します。この例では、二分木の基本的な構造を定義し、いくつかの基本的な操作（挿入、探索、および木の内容の表示）を行う方法を示します。

## サンプルプログラム
```dart
class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);

  // 新しい値を二分木に挿入
  void insert(int newValue) {
    if (newValue < value) {
      if (left == null) {
        left = TreeNode(newValue);
      } else {
        left!.insert(newValue);
      }
    } else {
      if (right == null) {
        right = TreeNode(newValue);
      } else {
        right!.insert(newValue);
      }
    }
  }

  // 二分木内で値を探索
  bool search(int targetValue) {
    if (targetValue == value) {
      return true;
    } else if (targetValue < value) {
      return left != null && left!.search(targetValue);
    } else {
      return right != null && right!.search(targetValue);
    }
  }

  // 二分木の内容を表示（中間順巡回）
  void inorderTraversal() {
    left?.inorderTraversal();
    print(value);
    right?.inorderTraversal();
  }
}

void main() {
  TreeNode root = TreeNode(10);
  root.insert(5);
  root.insert(15);
  root.insert(3);
  root.insert(7);
  root.insert(12);
  root.insert(18);

  print("二分木の内容（中間順巡回）:");
  root.inorderTraversal();

  print("値15は二分木に存在するか？ ${root.search(15)}");
}
```

このプログラムでは、`TreeNode` クラスを使用して二分木のノードを表現しています。各ノードは、値（ `value` ）、左の子（ `left` ）、および右の子（ `right` ）を持っています。`insert` メソッドは新しい値を適切な位置に再帰的に挿入し、`search` メソッドは特定の値が木に存在するかどうかを確認します。`inorderTraversal` メソッドは木の中間順巡回を行い、値を順に表示します。

`main` 関数では、木の根を作成し、いくつかの値を挿入してから、木の内容を表示し、特定の値が存在するかどうかを探索しています。
