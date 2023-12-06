// 非同期関数の定義
Future<String> fetchData() async {
  // 模擬的な遅延を作成（例えば、データベースからのデータ取得をシミュレート）
  await Future.delayed(Duration(seconds: 2));
  return '取得したデータ';
}

void main() async {
  print('データ取得開始...');

  // 非同期関数の呼び出しと結果の待機
  var data = await fetchData();

  print('取得したデータ: $data');
}
