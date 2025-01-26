chapter=4
story=21
title=motdファイル
keyword=super user
keyword=root
keyword=motd
prev=4/20/
prev-title=fstabファイル
next=4/22/
next-title=PAM

# `motd`ファイル

みどり（通常）：
  お兄ちゃん！
  ログイン時に表示される
  メッセージがあるよね？
  この管理もスーパユーザの
  仕事だと思うんだ！
しげる（通常）：
  そのとおりだよ
  このメッセージを
  「motd(message of the day)」呼ぶんだ
  今回は motd について学ぼう！

## `/etc/motd` ファイル

しげる（通常）：
  motd は「本日のお知らせ」という意味だよ
  `/etc/motd` に記載されている内容が
  ログイン時に表示されるんだ
みどり（通常）：
  ログインしたユーザは
  必ず目にするから
  全体周知に便利そうだね
しげる（通常）：
  そのとおりだよ
  例えば以下のような内容が
  `/etc/motd` に書かれるんだ

* サーバのメンテナンス情報
* システムポリシーや注意事項
* サーバやシステムに関する重要なお知らせ

みどり（通常）：
  ちょっとメッセージを
  作ってみたいなぁ
しげる（通常）：
  それならまずは
  オリジナルの `/etc/motd` の
  バックアップを作成しよう

```bash
sudo mv -v /etc/motd{,.dist}
```
みどり（通常）：
  うん！
  バックアップ作成は大事だね！
しげる（通常）：
  次にみどりが伝えたい内容が書かれた
  新しい `/etc/motd` を作成しよう！

```bash
sudo vim /etc/motd
```

みどり（通常）：
  こんな内容を
  入れてみたよ！

```plaintext
welcome to our server!
Please remember to log out after your session.
```

しげる（通常）：
  いいね！
  ログインし直して motd が
  表示されるか確認してみよう！

```plaintext
welcome to our server!
Please remember to log out after your session.
```

みどり（通常）：
  おお！
  新しく作った motd の
  内容が表示されたよ！
みどり（通常）：
  逆に `motd` を
  非表示には
  できないかな？
しげる（通常）：
  それなら `/etc/motd` を
  空ファイルにすればいいよ

```bash
sudo bash -c ': > /etc/motd'
```

みどり（通常）：
  なるほど！
  空にすれば motd の
  表示が無くなるんだね！

## まとめ

みどり（通常）：
  今回は motd と
  その内容の扱いを学んだよ！
  ここに書かれている内容が
  全ユーザのログイン時に
  表示されるんだ！
しげる（通常）：
  motd は運用管理や
  ユーザ通知に
  役立つ仕組みだよ
  適切に使いこなせるように
  しておこう！

