chapter=5
story=8
title=SSH鍵生成(macOS,Linux)
keyword=SSH
keyword=macOS
keyword=ssh-keygen
prev=5/7/
prev-title=SSH鍵生成(Windows)
next=5/9/
next-title=SSH接続先設定

# SSH鍵生成(macOS,Linux)

みどり（通常）：
  お兄ちゃん！
  macOS のノート PC があるんだけど
  ここからでも
  SSH 公開鍵認証で
  接続できるかな？
しげる（通常）：
  もちろん！
  まずは必要となる二つの鍵
  「秘密鍵」「公開鍵」を作ろう！
  macOS と Linux では
  操作がほとんど同じなので
  一緒に説明するね

## `.ssh` ディレクトリ

しげる（通常）：
  SSH 設定は
  `~/.ssh` ディレクトリに保存されるよ
  まずはこのディレクトリが
  あるかどうかを確認しよう

```bash
ls -ld ~/.ssh
```

みどり（通常）：
  うん！

```bash
drwx------. 2 midori midori 71 Dec  1 14:53 /home/midori/.ssh
```

みどり（通常）：
  ちゃんとあるみたいだね！
しげる（通常）：
  もし存在していなければ
  作ってあげよう

```bash
mkdir ~/.ssh
```

しげる（通常）：
  そうしたらパーミッションを確認しよう
  自身しかアクセスできないように
  なっていればいいよ
みどり（通常）：
  `rwx------` だね！
  所有グループや
  他のユーザには
  何も権限が無いよ！
しげる（通常）：
  もしそうでないなら `chmod` で
  パーミッションを設定しよう！

```bash
chmod 700 ~/.ssh
```

## `ssh-keygen` コマンド

しげる（通常）：
  `ssh-keygen` は
  SSH 鍵を生成するよ

```bash
ssh-keygen [オプション]...
```

オプション        | 役割
----------------- | ----
`-f パス`         | 鍵の出力先を指定(RSAの場合デフォルトは `~/.ssh/id_rsa`)
`-C コメント`     | 鍵にコメントを設定
`-P パスフレーズ` | パスフレーズを設定(空文字でパスフレーズを設定しない)

みどり（通常）：
  コメントは
  何に使うのかな？
しげる（通常）：
  複数の鍵を生成したときに
  鍵の区別をつけるために使われるよ
  「ユーザ名」「接続先」の
  2つの情報を含めておくのがいいね
  僕は `ユーザ名@接続先` としているよ
みどり（通常）：
  パスフレーズを設定すると
  どうなるのかな？
しげる（通常）：
  鍵を使おうとするたびに
  パスフレーズの入力が求められるよ
  そこで正しいパスフレーズを
  入力しないと鍵が使えないんだ
  設定すると毎回入力の手間が掛かるけど
  鍵が漏洩したときの対策になるんだ
みどり（通常）：
  なるほど
  自宅内で使う想定で
  毎回尋ねられるのも面倒だから
  今回は設定しなくても
  いいと思っているよ！
しげる（通常）：
  ここでは以下のように作成しよう！
  `接続先ホスト名` の箇所は
  実際の値に置き換えてね
みどり（通常）：
  私の場合は `DEST=carter` となるんだね！

```bash
DEST=接続先ホスト名
ssh-keygen -f "$HOME/.ssh/$USER@${DEST}_id_rsa" -C "$USER@$DEST" -P ""
```

みどり（通常）：
  変数を上手く
  使っているんだね！
しげる（通常）：
  上記のコマンドを実行すると
  「秘密鍵」と「公開鍵」が
  生成されるんだ

パス                                | 役割
----------------------------------- | ------
`~/.ssh/ユーザ名@接続先_id_rsa`     | 秘密鍵
`~/.ssh/ユーザ名@接続先_id_rsa.pub` | 公開鍵

みどり（通常）：
  これで準備が
  できたんだね！

## まとめ

みどり（通常）：
  今回は macOS や Linux で
  SSH 鍵を生成したよ！
  公開鍵認証でリモート接続するための
  第一歩なんだ！
しげる（通常）：
  この鍵を使うには
  接続先にも設定が必要なんだ
  次回は接続先で行う設定を説明するよ！

