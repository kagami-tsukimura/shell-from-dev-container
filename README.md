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

## 自作シェルの実行方法

- PATH の通っていないディレクトリ

  ```bash
  <ディレクトリパス>/pyminish
  ```

- PATH の通っているディレクトリ

  - `/usr/local/bin`等に配置
  - `/usr/local/bin`は、デフォルトで PATH が通っている

    - `export`コマンドや、`~/.bashrc`に記述して明示的に PATH を通せる。

    ```bash: ~/.bashrc
    export PATH=$HOME/commands:$PATH
    ```

  ```bash
  pyminish
  ```

## AWS の EC2 上で pyminish のテスト

`~/develop/terraform-sample/env/sample`で、`tf apply`を実行する。  
EC2 および本プロジェクトの`pyminish`を起動。

```bash
cd ~/develop/terraform-sample/env/sample
tf apply
```

### AWS 環境で確認

EC2 に接続し、`pyminish-user`でログインする。  
`pyminish`が起動していることを確認する。

### 動作テスト

1. EC2 で`ec2-user`で接続。
1. `ec2-user`で下記コマンドを実行。

   ```bash
   pstree -p
   ```

- sshd の下で、bash の起動を確認。

1. 別タブで、EC2 で`pyminish-user`で接続。
1. `ec2-user`で下記コマンドを実行。

   ```bash
   pstree -p
   ```

- sshd の下で、bash とは別に、python3 の起動を確認。
- `fork execve` というシステムコールで、sshd の pyminish を起動している。
- `ec2-user`で下記コマンドを実行し、`pyminish` が起動していることを確認する。

  ```bash
  sudo strace -ff -p <一番左のsshdのpid> 2>&1 | grep execve
  ```

- sample

  ```bash
  sudo strace -ff -p 5005 2>&1 | grep execve
  ```

- 指定した pid のプロセスの子プロセスのシステムコールから、`execve`のものを出力する。
  - 大量のシステムコールが発行される。（ログインで止まる）
