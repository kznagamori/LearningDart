// 共有データ
class SharedData {
  int value = 0;
}

// 非同期関数。共有データをカウントアップする
Future<void> asyncIncrement(SharedData sharedData) async {
  await Future.delayed(Duration(seconds: 1)); // 何らかの処理（遅延）をシミュレート
  sharedData.value++; // 共有データをカウントアップ
  print('Current value: ${sharedData.value}');
}

void main() async {
  final sharedData = SharedData();

  // 複数の非同期タスクを同時に実行し、共有データをカウントアップする
  await Future.wait([
    asyncIncrement(sharedData),
    asyncIncrement(sharedData),
    asyncIncrement(sharedData)
  ]);

  print('Final value: ${sharedData.value}');
}
