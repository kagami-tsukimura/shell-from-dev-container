# Linux システムプログラミング for 自作 Shell

## Windows, Mac 環境の場合

### Dev Containers での環境構築

- 事前準備（GitHub 上に作成済みの環境を Push 済みのため、一から作成は不要）

1. 端末に`Docker`をインストールする。
1. `VSCode`の拡張機能で`Dev Containers`をインストールする。
1. `Ctrl + Shift + P`で`Dev Containers Add Dev Container~`を選択する。
1. `ワークスペースに構成を追加する`を選択する。
1. `Python 3`を選択する。
1. `3.12-bookworm`を選択(2024/05/13 現在の Debian 系の最新版)する。
1. `.devcontainer`ディレクトリに json が配置されていることを確認する。

- Dev Container 環境の起動

1. `Ctrl + Shift + P`で`Dev Containers: ~ Reopen in Container`を選択する。
2. 構築完了（初回数分程度）後に、`Dev Container`環境に移行していることを確認する。

### path が通っているディレクトリの一覧表示

```bash
echo $PATH | tr ":" "\n"
```
