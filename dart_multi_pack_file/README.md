# 複数ファイルを機能ごとにパッケージを分けて使用する

Dartで複数ファイルを機能ごとに分けてパッケージ化し、異なるプロジェクト間でそれらを使用するための手順とサンプルプログラムを以下に示します。この例では、一つのライブラリパッケージ（ `my_library `）と、それを利用する別のプロジェクト（ `my_app` ）を作成します。

## プロジェクト構成
### ステップ1: ライブラリパッケージの作成
**1. 新しいライブラリパッケージのプロジェクトを作成:**
```bash
dart create -t package-simple my_library
```

**2. ライブラリの機能を実装:**
`my_library` プロジェクト内のlibディレクトリに、機能ごとに分割したファイルを作成します。
例えば、`lib/greetings.dart` を作成します。
**lib/greetings:**
```dart
// greeting.dart
String Greet(String name) {
  return "こんにちは、$nameさん!";
}
```

**3. pubspec.yamlの編集:**
ライブラリの `pubspec.yaml` に必要な情報を記載します。
依存関係（他のパッケージに依存している場合）やバージョン情報を正確に設定します。
**my_library/pubspec.yaml:**
```yaml
name: my_library
description: A sample library package
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.2.2

# Add regular dependencies here.
dependencies:
  # path: ^1.8.0

dev_dependencies:
  lints: ^2.1.0
  test: ^1.24.0
```

### ステップ2: アプリケーションパッケージの作成
**1. 新しいアプリケーションパッケージのプロジェクトを作成:**
```bash
dart create my_app
```

**2. pubspec.yamlでライブラリパッケージを依存関係に追加:**
`my_app` プロジェクトの `pubspec.yaml` に、先ほど作成した `my_library` パッケージへの依存関係を追加します。
ライブラリがローカルにある場合は、ファイルパスを指定します。
**my_app/pubspec.yaml:**
```yaml
name: my_app
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.2.2

# Add regular dependencies here.
dependencies:
  my_library:
    path: ../my_library

dev_dependencies:
  lints: ^2.1.0
  test: ^1.24.0
```

**3. 依存関係の取得:**
- `my_app`ディレクトリで、以下のコマンドを実行してパッケージの依存関係の解決を行います。
```bash
dart pub get
```

### ステップ3: アプリケーションパッケージでライブラリを使用
**1. main.dartでライブラリの機能をインポートして使用:**
```dart
import 'package:my_library/greetings.dart';

void main() {
  var name = 'Dart';
  print(Greet(name)); // `greet`関数の使用
}
```

### ステップ4: アプリケーションの実行
- `my_app`ディレクトリで、以下のコマンドを実行してアプリケーションを起動します。
```bash
dart run
```
以上のステップに従うことで、Dartで機能ごとに分けたパッケージを作成し、それを別のプロジェクトから使用することができます。ライブラリパッケージは再利用可能なコードの集まりとして機能し、アプリケーションパッケージはこれらのライブラリを利用して具体的なアプリケーションを構築します。
