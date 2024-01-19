# パッケージをインストールして使用する

Dartで実行可能なパッケージを作成し、GitHubに登録して、`dart pub global activate` コマンドを使ってパッケージのバイナリをインストールする手順は以下の通りです。また、ローカルパッケージを `dart pub global activate` でインストールする手順も含めて説明します。

## GitHubにパッケージを登録してインストールする手順
### 1. 実行可能なDartパッケージの作成
#### 1.1. 新しいパッケージの作成:
```bash
dart create -t console-full my_package
cd my_package
```
実行可能なスクリプトの追加:
bin ディレクトリに `.dart` ファイルを作成し（例：`bin/main.dart` ）、実行可能なコードを書きます。

#### 1.2. `pubspec.yaml`の編集:
パッケージ名、説明、バージョンを設定します。
`executables`  セクションを追加して、実行可能なスクリプトを指定します。
```yaml
name: my_package
description: A sample command-line application.
version: 1.0.0

executables:
  my_package: main
```
ここで、`my_package` はコマンド名、`main` は `bin` ディレクトリ内の `.dart` ファイルの名前です。

#### 1.3. 依存関係の解決:
```bash
dart pub get
```
### 2. GitHubにパッケージを登録
#### 2.1. GitHubにリポジトリを作成:
1. GitHubで新しいリポジトリを作成します（例：`my_package`）。

2. ローカルリポジトリの初期化とコミット:
```bash
git init
git add .
git commit -m "Initial commit"
```
3. GitHubリポジトリとのリンク:
GitHubリポジトリのURLを使用してローカルリポジトリをリモートリポジトリにリンクします。
```bash
git remote add origin [GitHubリポジトリのURL]
git push -u origin master
```

### 3. dart pub global activateでパッケージのバイナリをインストール
1. GitHubからパッケージをインストール:
```bash
dart pub global activate -sgit [GitHubリポジトリのURL]
```
これにより、GitHubリポジトリにあるパッケージがグローバルにインストールされます。


## ローカルパッケージをdart pub global activateでインストールする手順

ローカルパッケージをインストールするには、ローカルパスを使用します。

1. ローカルパッケージのインストール:
```bash
dart pub global activate --source path [ローカルパッケージのパス]
```
ここで、[ローカルパッケージのパス]はローカルのパッケージディレクトリへのパスです。

**※注意**
ローカルパッケージのインストール先ででは、ローカルパッケージを参照しているため、移動や削除を行った場合、正しく動作しなくなります。


これらの手順に従うことで、Dartのパッケージを作成し、GitHubに公開し、それをグローバルにインストールすることができます。また、ローカルパスを使用してローカルのパッケージをグローバルにインストールすることも可能です。





