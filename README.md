# LearningDart
Dart学習用レポジトリ

## Dartとは
Dart言語は、Googleによって開発されたプログラミング言語です。2011年に初めて公開され、主にウェブ、モバイル、デスクトップアプリケーションの開発に使用されています。以下にDartの主要な特徴をいくつか挙げます：

1. オブジェクト指向：Dartはオブジェクト指向プログラミング言語で、クラスベースの継承をサポートしています。

2. ガベージコレクション：自動メモリ管理を提供し、開発者がメモリ割り当てについて心配する必要がありません。

3. 静的＆動的型付け：Dartは静的型付けをサポートしつつも、動的型付けの機能も持っています。つまり、コンパイル時に型チェックが行われるが、動的型付け言語の柔軟性も持ち合わせています。

4. クライアントとサーバサイドの開発：Dartはウェブブラウザ上で動作するクライアントサイドのアプリケーション開発に使用できるだけでなく、サーバサイドアプリケーションやコマンドラインツールの開発にも適しています。

5. Flutterとの組み合わせ：Dartは特にGoogleのモバイルアプリケーションフレームワークであるFlutterと組み合わせて使用されます。Flutterを用いて、iOSとAndroidの両方のプラットフォームに向けた高性能なモバイルアプリケーションを一つのコードベースから開発することができます。

6. モダンな機能：非同期プログラミング（async/await）、ジェネリクス、ラムダ式など、現代のプログラミング言語で期待される多くの機能をサポートしています。

7. 強力なツールセット：効果的な開発のために、パフォーマンスプロファイリング、デバッグ、コードコンパイルなどをサポートする強力なツールが提供されています。

Dartのこれらの特徴により、ウェブアプリケーションのフロントエンド開発や、特にFlutterを使用したクロスプラットフォームのモバイルアプリケーション開発において人気があります。また、その柔軟性と効率性から、多様なソフトウェア開発プロジェクトにおいて採用されています。

### 推しポイント
- 構文がC#に近いため、学習コストが低い。
- 使用可能なパッケージが多く存在するので、ツールを作成しやすい。
- ChatGPTで質問すると、かなり正解に近いコードを取得できる。

### いまいち、ダメなポイント
- 実行速度が遅い
- スレッドがないため、並列処理の実現がいまいち
- ローカルパッケージのインストールがローカルプロヘクトの参照なのでインストールしたら移動・削除できない。

## 基礎
- [プロジェクト作成からビルドまでの手順](./dart_start_project/README.md)
- [外部パッケージを使用したプログラムを作成する手順](./dart_use_package/README.md)
- [複数ファイルを使用する](./dart_multi_file/README.md)
- [複数ファイルを機能ごとにパッケージを分けて使用する](./dart_multi_pack_file/README.md)
- [ファイル内グローバル変数と関数、ファイル外グローバル変数と関数](./dart_global_local_scope/README.md)
- [クラスを使う](./dart_class_methods/README.md)
- [パブリックなクラスのメンバ、メソッドを定義とプライベートなクラスのメンバ、メソッドを定義する](./dart_public_private/README.md)
- [クラスの継承を実現する](./dart_inherit_class/README.md)
- [クラスのインタフェースを使用したポリモーフィズムの実現](./dart_poly_class/README.md)
- [C#みたいなクラスのプロパティを定義、使用](./dart_class_property/README.md)
- [一般的なエラー処理](./dart_error_handling/README.md)
- [各型のstring formatの組み合わせ](./dart_string_format/README.md)
- [ジェネリック機能](./dart_generics_example/README.md)
- [ラムダ式](./dart_lambda_example/README.md)
- [C#みたいなLINQ機能](./dart_linq_example/README.md)

## アルゴリズムとデータ構造
- [リンクドリスト構造](./dart_linked_list/README.md)
- [リングバッファ構造](./dart_ring_buffer/README.md)
- [キュー構造](./dart_data_queue/README.md)
- [スタック構造](./dart_data_stack/README.md)
- [二分木構造](./dart_binary_tree/README.md)
- [平衡二分木構造](./dart_balanced_tree/README.md)
- [ハッシュテーブル](./dart_hash_table/README.md)
- [クイックソート](./dart_quick_sort/README.md)
- [再帰を使用しないシェルソート](./dart_non_recursive_shell_sort/README.md)

## 応用
- [リンクドリスト](./dart_list_package/README.md)
- [キュー](./dart_queue_package/README.md)
- [平衡二分木](./dart_balanced_tree_package/README.md)
- [ハッシュテーブル](./dart_hash_table_package/README.md)
- [ソート](./dart_sort_package/README.md)
- [スレッド](./dart_threading_example/README.md)
- [Async/Await](./dart_async_await_example/README.md)
- [排他処理](./dart_mutex_example/README.md)
- [メッセージボックス](./dart_message_box_example/README.md)

## エコシステム
- [パッケージをインストールして使用する](./dart_install_package/README.md)
