chapter=5
story=9
title=SSH接続先設定
keyword=SSH
keyword=authorized_keys
prev=5/8/
prev-title=SSH鍵生成(macOS,Linux)
next=5/10/
next-title=SSH公開鍵認証(Windows)

# SSH接続先設定

みどり（通常）：
  お兄ちゃん！
  前回は SSH 鍵を
  作成したね！
しげる（通常）：
  今回は接続先で
  必要な設定を行おう！

## `.ssh` ディレクトリ

しげる（通常）：
  SSH 設定は
  `~/.ssh` ディレクトリに
  保存されるよ
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

## `authorized_keys` ファイル

しげる（通常）：
  `~/.ssh/authorized_keys` ファイルの各行には
  接続で使用する公開鍵が
  登録されているんだ
  このファイルを
  確認してみよう！

```bash
ls -l ~/.ssh/authorized_keys
```

みどり（通常）：
  うん！

```console
-rw------- 1 midori midori 1742 Nov 24 11:02 /home/midori/.ssh/authorized_keys
```

みどり（通常）：
  ちゃんとあるね！
しげる（通常）：
  もし存在していなければ
  作ってあげよう！

```bash
touch ~/.ssh/authorized_keys
```

しげる（通常）：
  このファイルもパーミッションが
  厳密に設定されている必要があるよ
  所有ユーザに「読み書き」権限だけが
  設定されていないといけないんだ
みどり（通常）：
  `rx-------` だから
  大丈夫だね！
しげる（通常）：
  もしそうでないなら `chmod` で
  パーミッションを設定しよう！

```bash
chmod 600 ~/.ssh/authorized_keys
```

しげる（通常）：
  そうしたら
   `~/.ssh/authorized_keys` に
  「公開鍵」を書き込もう
  `vim` で編集してもいいし
  出力リダイレクト `>>` で
  追記でもいいよ
みどり（通常）：
  公開鍵の内容って長くて複雑だよね
  マウスを使った貼り付けを使うのがいいね
しげる（通常）：
  これで接続先の
  準備は完了だよ！

## まとめ

みどり（通常）：
  今回は SSH での公開鍵認証の
  接続先での設定を行ったよ！
しげる（通常）：
  前準備が色々必要だったけど
  次回はいよいよ接続するよ！
  楽しみにしていてね！

