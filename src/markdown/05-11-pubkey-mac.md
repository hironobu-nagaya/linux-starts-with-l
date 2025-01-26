chapter=5
story=11
title=SSH公開鍵認証(macOS,Linux)
keyword=SSH
keyword=public key authorization
keyword=macOS
prev=5/10/
prev-title=SSH公開鍵認証(Windows)
next=5/12/
next-title=SCP(Windows)

# SSH公開鍵認証(macOS,Linux)

みどり（通常）：
  前回までで `ssh-keygen` で
  SSH 鍵を生成したよ！
  そして接続先に公開鍵の
  登録までを済ませたんだ！
しげる（通常）：
  今回はいよいよ
  公開鍵認証で
  SSH 接続するよ！

## SSH 設定ファイル作成

しげる（通常）：
  次は接続設定ファイル
  `~/.ssh/config` を作成しよう
  以下のコマンドで
  エディタを開こう

```bash
vim ~/.ssh/config
```

みどり（通常）：
  新規にファイルを開いたよ
  内容は何を書けばいいのかな？
しげる（通常）：
  以下のテンプレートにそって
  自分の環境に合わせて記述しよう

```plaintext
Host 接続名
  Hostname     接続先IPアドレス
  User         接続ユーザ名
  IdentityFile 使用する秘密鍵のパス
```

みどり（通常）：
  書いたよ！
  これで接続の準備が
  できたんだね

```plaintext
Host carter
  Hostname     192.168.0.100
  User         midori
  IdentityFile ~/.ssh/midori@carter_id_rsa
```

## SSH 接続

しげる（通常）：
  設定が終わったら
  `ssh` を実行して
  SSH 接続しよう

```bash
ssh 接続名
```

みどり（通常）：
  私の場合は
  こうすれば
  いいんだね！

```bash
ssh carter
```

しげる（通常）：
  そのとおり！
  試してみて

```console
The authenticity of host 'carter(192.168.0.100)' can't be established.
ED25519 key fingerprint is SHA256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

みどり（通常）：
  SSH のときにも出てきた
  初回接続の確認だね！
  問題ないので
  `yes` と入力するよ！

```console
$ !cursor!
```

みどり（通常）：
  よし！
  接続ができたよ！
しげる（通常）：
  もし鍵にパスフレーズを
  設定していた場合
  パスフレーズをたずねられるよ
  正しいパスフレーズを
  入力してあげよう

## まとめ

みどり（通常）：
  今回は macOS や Linux で
  公開鍵認証を使った
  SSH 接続を行ったよ！
  パスフレーズを設定していなければ
  接続から操作ができるまで
  そのまま通っちゃうんだね！
しげる（通常）：
  現時点で公開鍵認証は
  鍵がちゃんと管理されている限りは
  まず突破は不可能な認証なんだ
  安全にリモート接続するためにも
  公開鍵認証をつかうことを
  おすすめするよ！

