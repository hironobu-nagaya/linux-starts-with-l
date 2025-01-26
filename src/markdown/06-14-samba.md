chapter=6
story=14
title=Samba
keyword=daemon
keyword=Samba
prev=6/13/
prev-title=smartmontools
next=6/15/
next-title=ClamAV

# Samba

みどり（通常）：
  お兄ちゃん！
  Windows の「ワークグループ」に
  Linux を入れてあげられないかな？
しげる（通常）：
  Windows 同士がお互いを認識して
  ファイルをやりとりしたり
  ネットワーク内のプリンタなどを
  使えるようにする仕組みだね
しげる（通常）：
  [Samba](https://www.samba.org/) は
  Windows の作法で
  対話してくれるツールなんだ
  これを使えば Linux を
  Windows ワークグループに
  参加させられるよ
みどり（通常）：
  へぇ！
  試してみたい！

## インストール

しげる（通常）：
  Samba のパッケージ名は `samba` だよ
  パッケージ管理システムから
  インストールしよう

```bash
sudo apt install -y samba
```

みどり（通常）：
  うん！
  準備完了だよ！

## 設定

しげる（通常）：
  今回はゲストに共有する方法で設定するよ
  Samba サーバにアクセスできれば
  誰でも読み書きができるんだ
みどり（通常）：
  自宅内なら良さそうな方法だね！
しげる（通常）：
  最初にゲスト用アカウントを確認しよう
  `samba` や `nobody` のようなユーザ名だよ
しげる（通常）：
  以下でユーザ名一覧を表示できるよ

```bash
awk -F: '{ print $1 }' /etc/passwd
```

みどり（通常）：
  うん！
  `samba` ユーザが
  新しく追加されている！
  このユーザが Samba の
  ゲスト用アカウントになるんだね
しげる（通常）：
  同様にグループも確認してみよう
  `samba` や `nobody`, `nogroup`
  のようなグループ名なんだ
しげる（通常）：
  以下でグループ名一覧を表示できるよ

```bash
awk -F: '{ print $1 }' /etc/group
```

みどり（通常）：
  グループ名も
  `samba` だったよ！
しげる（通常）：
  ここまでで
  必要なアカウントの準備は
  大丈夫だね！
しげる（通常）：
  次はワークグループで
  共有するディレクトリを作ろう

```bash
sudo mkdir -pv /srv/samba/share
```

みどり（通常）：
  ここに共有ファイルが
  置かれるのね！
しげる（通常）：
  そういうことだね
  でも `sudo` で作ったので
  `root` ユーザの持ち物なんだ
  `chown` で` share` ディレクトリの
  所有権を変更しよう

```bash
sudo chown -c samba:samba /srv/samba/share
```

みどり（通常）：
  所有権を変更したよ！
  ということはパーミッションも
  確認だよね！
しげる（通常）：
  そう！
  所有権とパーミッションはセットだったね！
  同じくパーミッションも変更しよう
  全てを許可する `777` にするよ

```bash
sudo chmod -c 777 /srv/samba/share
```

みどり（通常）：
  これでディレクトリの
  準備は OK かな？
しげる（通常）：
  うん
  大丈夫だよ！
しげる（通常）：
  最後に設定ファイルを編集しよう
  Samba の設定ファイルは多くの場合
  `/etc/samba/smb.conf` だよ
しげる（通常）：
  まずは設定ファイルの
  バックアップを取ろう

```bash
sudo mv -v /etc/samba/smb.conf{,.dist}
```

みどり（通常）：
  これで期待どおりに
  動かなくても
  元に戻せて安心だね！
しげる（通常）：
  では設定ファイルを作成しよう！
  今回は紹介なので
  最低限の設定のみ行うよ

```bash
sudo bash -c 'cat > /etc/samba/smb.conf << \EOF
[global]                  !start-class-silver!# 全体設定!end!
  guest account = samba   !start-class-silver!# ゲストアクセスで使用されるアカウント!end!
  workgroup = WORKGROUP   !start-class-silver!# Windows のデフォルトワークグループ名!end!
  security = user         !start-class-silver!# 認証方式!end!

[share]                   !start-class-silver!# share 設定!end!
  path = /srv/samba/share !start-class-silver!# 共有ディレクトリのパス!end!
  writable = yes          !start-class-silver!# 書き込みを許可!end!
  guest only = yes        !start-class-silver!# ゲストアクセスのみ許可!end!
  guest ok = yes          !start-class-silver!# ゲストアクセスを許可!end!
  create mask = 0777      !start-class-silver!# ファイル作成時のデフォルト権限!end!
  directory mask = 0777   !start-class-silver!# ディレクトリ作成時のデフォルト権限!end!
EOF'
```

みどり（通常）：
  意外と設定項目が
  少ないんだね！
しげる（通常）：
  `testparm` は
  Samba 設定ファイルの
  書式確認をするよ
  これを実行してエラーが
  出ないことを確認しよう！

```bash
testparm
```

みどり（通常）：
  これも大丈夫だったよ
  共有するのが楽しみ！

## 起動

しげる（通常）：
  では `systemctl` で
  Samba を起動して
  自動起動も有効にしよう！

```bash
sudo systemctl enable --now samba
```

しげる（通常）：
  Samba は `smbd` と `nmbd` の
  2つのデーモンで成り立っているんだ
  ディストリビューションによっては
  以下のように指定する
  必要があるかもしれないよ

```bash
sudo systemctl enable --now smbd nmbd
```

しげる（通常）：
  実行後は
  ちゃんと起動したかどうか
  確認しよう！

```bash
sudo systemctl status samba
```

みどり（通常）：
  うん！
  ちゃんと動いてくれている！
しげる（通常）：
  多くの場合 Windows ネットワークにすぐに認識されるよ
  Windows の「ネットワーク」から確認してみよう！
みどり（通常）：
  あっ！
  Windows のネットワークに
  新しいホスト `carter` が
  表示されているよ！
みどり（通常）：
  「share」という
  ディレクトリがあって…
  ファイルも自由に置けるね！

## まとめ

みどり（通常）：
  今回は Linux を
  Windows ワークグループに
  参加させられる Samba を扱ったよ！
  Windows とファイル共有などが
  できるようになるんだ！
しげる（通常）：
  これも最も基本的な設定のみの紹介だよ
  例えば認証しないとアクセスできないなどの
  設定もできるんだ
  詳しくは今回の内容を基に検索してみよう！

