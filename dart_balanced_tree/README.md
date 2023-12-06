# 平衡二分木構造

Dartで平衡二分木（特に `AVL（Adelson-Velsky and Landis）`木）を実装するサンプルプログラムを以下に示します。AVL木は、自己平衡二分探索木で、挿入、削除、探索の各操作を `O(log n)` の時間複雑度で行うことができます。この木は、各ノードにおいて左右の子の高さの差が最大1であることを保証することで平衡を維持します。

## サンプルプログラム
```dart
class AVLNode {
  int value;
  AVLNode? left;
  AVLNode? right;
  int height;

  AVLNode(this.value) : height = 1;

  // ノードの高さを更新
  void updateHeight() {
    height = 1 + _max(_height(left), _height(right));
  }

  // 左回転を実行
  AVLNode rotateLeft() {
    AVLNode rightNode = right!;
    right = rightNode.left;
    rightNode.left = this;
    updateHeight();
    rightNode.updateHeight();
    return rightNode;
  }

  // 右回転を実行
  AVLNode rotateRight() {
    AVLNode leftNode = left!;
    left = leftNode.right;
    leftNode.right = this;
    updateHeight();
    leftNode.updateHeight();
    return leftNode;
  }

  // バランスファクターを取得
  int get balanceFactor => _height(left) - _height(right);

  // ノードの高さを取得
  static int _height(AVLNode? node) => node?.height ?? 0;

  // 最大値を取得
  static int _max(int a, int b) => (a > b) ? a : b;

  // AVL木に値を挿入
  AVLNode insert(int newValue) {
    if (newValue < value) {
      left = left?.insert(newValue) ?? AVLNode(newValue);
    } else if (newValue > value) {
      right = right?.insert(newValue) ?? AVLNode(newValue);
    } else {
      return this; // 同じ値は挿入しない
    }

    updateHeight();
    return _balance();
  }

  // ツリーを平衡化
  AVLNode _balance() {
    if (balanceFactor > 1) {
      if (left!.balanceFactor < 0) {
        left = left!.rotateLeft();
      }
      return rotateRight();
    }
    if (balanceFactor < -1) {
      if (right!.balanceFactor > 0) {
        right = right!.rotateRight();
      }
      return rotateLeft();
    }
    return this;
  }

  void inorderTraversal(StringBuffer buffer) {
    left?.inorderTraversal(buffer);
    buffer.write('$value ');
    right?.inorderTraversal(buffer);
  }
}

class AVLTree {
  AVLNode? root;

  void insert(int value) {
    root = root?.insert(value) ?? AVLNode(value);
  }

  // ツリーを文字列として表示
  @override
  String toString() {
    var buffer = StringBuffer();
    root?.inorderTraversal(buffer);
    return buffer.toString();
  }
}

void main() {
  AVLTree tree = AVLTree();
  tree.insert(30);
  print("Hight: ${tree.root?.height}");
  tree.insert(20);
  print("Hight: ${tree.root?.height}");
  tree.insert(40);
  print("Hight: ${tree.root?.height}");
  tree.insert(10);
  print("Hight: ${tree.root?.height}");
  tree.insert(25);
  print("Hight: ${tree.root?.height}");
  tree.insert(35);
  print("Hight: ${tree.root?.height}");
  tree.insert(50);
  print("Hight: ${tree.root?.height}");

  print('平衡二分木:');
  print(tree);
}

```

このプログラムでは、`AVLNode` クラスでノードを表現し、`AVLTree` クラスで全体の木を管理しています。`AVLNode` は値、左子、右子、および高さを持っており、`insert` メソッドで新しい値を木に挿入し、必要に応じて左回転または右回転を行って木を平衡状態に保ちます。

`main` 関数では、`AVLTree` のインスタンスを作成し、いくつかの値を挿入しています。この例では木の表示機能は簡略化していますが、実際には木の構造をわかりやすく表示するための追加のメソッドを実装することができます。

