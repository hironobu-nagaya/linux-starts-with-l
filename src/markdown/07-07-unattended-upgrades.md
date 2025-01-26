chapter=7
story=7
title=パッケージ自動更新
keyword=Raspberry Pi
keyword=unattended-upgrades
prev=7/6/
prev-title=ブートローダ更新
next=7/8/
next-title=Raspberry Pi独自機能

# パッケージ自動更新

みどり（通常）：
  お兄ちゃん！
  パッケージを毎回 `apt` で手動更新するのは面倒だよ！
  `cron` で定期的に更新させても良いの？
しげる（通常）：
  それならもっと良い方法があるよ
  `unattended-upgrades` パッケージを使うんだ
  これはパッケージの自動更新をしてくれるよ
みどり（通常）：
  専用のパッケージがあるんだ！
  それを試そうよ！

## インストール

しげる（通常）：
  まずは `unattended-upgrades` パッケージをインストールしよう

```bash
sudo apt install -y unattended-upgrades
```

みどり（通常）：
  うん！
  インストールしたよ
  次は設定だね？

## 設定

しげる（通常）：
  設定ファイルは `/etc/apt/apt.conf.d/50unattended-upgrades` にあるよ
  設定をコピーしてコピー先を編集するようにしよう
しげる（通常）：
  まずは設定ファイルのコピーだよ

```bash
sudo cp -v /etc/apt/apt.conf.d/5{0,1}unattended-upgrades
```

みどり（通常）：
  ファイル名先頭の数字が1だけ大きい名前の設定ファイルを作るんだね
しげる（通常）：
  このように先頭が数字となっている設定ファイルはファイル名の辞書順に設定が読み込まれるんだ
  数字を増やした設定ファイルを作ってそちらが元の設定を上書きするようにしているよ
しげる（通常）：
  次にコピーした設定ファイルをエディタで開いてみよう

```bash
sudo vim /etc/apt/apt.conf.d/51unattended-upgrades
```

しげる（通常）：
  最初の `Unattended-Upgrade::Origins-Pattern { ... };` が更新対象のパッケージを指定する項目だよ
みどり（通常）：
  デフォルトはセキュリティ関連の更新しかしてくれないんだね
  サーバが安定して動いて欲しい場合には良さそう！
  でも私は普通に全部更新して欲しいな
しげる（通常）：
  それならコメントアウトされている項目を有効にすればいいよ
  設定は各項目に丁寧なコメントが付いているので大抵は読めばわかるよ
  以下の設定項目も良く変更されるから覚えておくと便利だよ

設定項目                                       | 意味
---------------------------------------------- | ----
Unattended-Upgrade::Automatic-Reboot           | 再起動が必要な場合に自動で再起動するか（`true`/`false`で指定）
Unattended-Upgrade::Automatic-Reboot-WithUsers | ログイン中のユーザがいても再起動するかどうか（`true`/`false`で指定）
Unattended-Upgrade::Automatic-Reboot-Time      | 再起動する時刻の指定

みどり（通常）：
  再起動が必要な場合は真夜中に自動再起動してくれるよう設定したよ！

## 起動

しげる（通常）：
  設定が終わったら動かそう！
  自動起動も一緒に設定するよ

```bash
sudo systemctl enable --now unattended-upgrades
```

しげる（通常）：
  正常に起動したかどうかは以下で確認できるよ

```bash
sudo systemctl status unattended-upgrades
```

みどり（通常）：
  うん！
  ちゃんと動いてくれたよ！

## まとめ

みどり（通常）：
  今回はパッケージを自動更新してくれる `unattended-upgrades` を扱ったよ！
  これで手動更新しなくても良くなったね！
しげる（通常）：
  定期的な更新はセキュリティを保つためにも重要だから
  自動更新をしておくと忘れることもないし安心だよ！

