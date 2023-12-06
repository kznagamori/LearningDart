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
