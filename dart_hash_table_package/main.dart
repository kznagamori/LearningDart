void main() {
  // Mapのインスタンスを作成
  var hashMap = <String, String>{};

  // 要素を追加
  hashMap['apple'] = 'りんご';
  hashMap['banana'] = 'バナナ';
  hashMap['orange'] = 'オレンジ';

  // マップの内容を表示
  print('ハッシュマップの内容:');
  hashMap.forEach((key, value) {
    print('$key: $value');
  });

  // 特定のキーの値を取得
  String? fruit = hashMap['apple'];
  print('appleの翻訳: $fruit');

  // 要素を更新
  hashMap['apple'] = 'アップル';
  print('更新後のappleの翻訳: ${hashMap['apple']}');

  // 要素を削除
  hashMap.remove('banana');
  print('bananaを削除後のハッシュマップ:');
  hashMap.forEach((key, value) {
    print('$key: $value');
  });
}
