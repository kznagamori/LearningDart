# プロジェクト作成からビルドまでの手順

Dartでコマンドラインプログラムを作成するための一連の手順と、実行可能なサンプルプログラムの例を説明します。

## Dartプロジェクトの作成
1. **Dart SDKのインストール**: Dart SDKがまだインストールされていない場合は、Dartの公式サイトからダウンロードしてインストールします。

2. **プロジェクトの作成**: コマンドラインで以下のコマンドを実行して新しいDartプロジェクトを作成します。
```dart
dart create -t console dart_start_project
```
これにより、`dart_start_project`という名前の新しいディレクトリが作成され、必要なファイルが含まれます。

3. **ディレクトリの移動**: 作成したディレクトリに移動します。
```powershell
cd dart_start_project
```

## プログラムの編集
1. **ソースファイルの編集**: binディレクトリ内の `dart_start_project.dart` ファイルを編集します。このファイルにコマンドラインプログラムのコードを書きます。

### サンプルプログラム
以下はシンプルなサンプルプログラムの例です。このプログラムはコマンドラインに `"Hello, Dart!"` と表示します。
```dart
// main.dart
void main(List<String> arguments) {
  print('Hello, Dart!');
}
```
## プログラムの実行
1. **プログラムの実行**: 以下のコマンドを実行してプログラムを起動します。
```powershell
dart run
```
これにより、`dart_start_project.dart` 内のプログラムが実行されます。

## ビルド（オプション）
- Dartプログラムを単独で実行可能なバイナリファイルにビルドすることも可能ですが、これはオプショナルです。以下のコマンドを使用して実行可能ファイルを生成できます。

```powershell
dart compile exe bin/dart_start_project.dart -o dart_start_project.exe
```
これにより、`dart_start_project.exe` という実行可能ファイルが生成されます。

これらの手順に従うことで、Dartを使ってコマンドラインプログラムを簡単に作成し、実行することができます。