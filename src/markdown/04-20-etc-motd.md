chapter=4
story=20
title=motdファイル
keyword=super user
keyword=root
keyword=motd
prev=4/19/
prev-title=fstabファイル
next=4/21/
next-title=PAM

# `motd`ファイル

みどり（通常）：
  お兄ちゃん！
  ログイン時に表示されるメッセージがあるよね？
  この管理もスーパユーザの仕事だと思うんだ！
しげる（通常）：
  そのとおりだよ
  このメッセージを「motd(message of the day)」呼ぶんだ
  今回は motd について学ぼう！

## `/etc/motd` ファイル

しげる（通常）：
  motd は「本日のお知らせ」という意味だよ
  `/etc/motd` に記載されている内容が
  ログイン時に表示されるんだ
みどり（通常）：
  ログインしたユーザは必ず目にするから
  全体周知に便利そうだね
しげる（通常）：
  そのとおりだよ
  例えば以下のような内容が
  `/etc/motd` に書かれるんだ

* サーバのメンテナンス情報
* システムポリシーや注意事項
* サーバやシステムに関する重要なお知らせ

みどり（通常）：
  ちょっとメッセージを作ってみたいなぁ
しげる（通常）：
  それならまずはオリジナルの
  `/etc/motd` のバックアップを作成しよう

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
  こんな内容を入れてみたよ！

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
  新しく作った motd の内容が表示されたよ！
みどり（通常）：
  逆に `motd` を非表示にはできないかな？
しげる（通常）：
  それなら `/etc/motd` を
  空ファイルにすればいいよ

```bash
sudo bash -c ': > /etc/motd'
```

みどり（通常）：
  なるほど！
  空にすれば motd の表示が無くなるんだね！

## まとめ

みどり（通常）：
  今回は motd とその内容の扱いについて学んだよ！
しげる（通常）：
  motd は運用管理やユーザ通知に役立つ仕組みだよ
  適切に使いこなせるようにしておこう

