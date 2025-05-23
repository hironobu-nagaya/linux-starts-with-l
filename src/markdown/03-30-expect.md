chapter=3
story=30
title=expectコマンド
keyword=shell script
keyword=expect
keyword=interactive
prev=3/29/
prev-title=ANSIエスケープシーケンス
next=4/1/
next-title=スーパユーザ

# `expect` コマンド

みどり（通常）：
  お兄ちゃん！
  「対話的」なコマンドがあると自動化しにくいよ！
  問い合わせが来るから画面から離れられないんだ！
しげる（通常）：
  今回は対話的なコマンドの対話を自動化しよう！
みどり（驚き）：
  えっ？
  自動化できるの？！

## 使い方

しげる（通常）：
  `expect` は対話的なプログラムのやりとりを
  自動化してくれるツールだよ

```bash
expect [オプション]... [引数]...
```

しげる（通常）：
  `expect` はスクリプト言語なんだ
  シェルスクリプトのように `expect` コマンドを書いていき
  それを実行することで対話を自動化してくれるんだ
みどり（通常）：
  `expect` 独自のコマンドを覚える必要があるのね…
しげる（通常）：
  `expect` のコマンドはたくさんあるけど
  幾つかを覚えれば十分自動化できるんだ
  最初は以下を覚えよう！

`expect` コマンド | 役割
----------------- | ----
`spawn コマンド`  | `コマンド` を `expect` の管理下で実行する
`sleep 秒数`      | `秒数` 間待機する、小数の指定も可能
`expect 文字列`   | `expect` 管理下のコマンドが指定された文字列を出力するまで待機する
`send 文字列`     | `expect` 管理下のコマンドに文字列を送る
`wait`            | `expect` 管理下のコマンドが終了するまで待機する
`close`           | `expect` 管理下のコマンドを終了する

## 実践

みどり（通常）：
  説明だけだと使いこなせる気がしないよ
  実例が見てみたいなぁ
しげる（通常）：
  それでは `expect` で
  `passwd` の対話を自動化してみよう！

```bash
USERNAME=midori
sudo expect << EOF
spawn passwd "$USERNAME"
expect "New password:"
send "$USERNAME\r"
expect "Retype new password:"
send "$USERNAME\r"
wait
EOF
```

しげる（通常）：
  最初の1行で変数を定義している以外は `expect` の処理だよ！
みどり（通常）：
  `expect` の前に `sudo` ってあるね？
  確か管理者権限でコマンドを実行だったはずだけど…
しげる（通常）：
  他人のパスワード変更は
  管理者の仕事なので `sudo` が必要なんだ
  `sudo` は管理者を話すときに詳しく説明するね
みどり（通常）：
  `expect` のヒアドキュメントの内容が
  `expect` スクリプトになっているんだね！
  ここで自動化の指示をしているんだ！
しげる（通常）：
  そういうことだよ
  `expect` スクリプトの内容を
  1行ずつ読み解いてみよう
  最初の行はどういう意味かな？

```expect
spawn passwd "$USERNAME"
```

みどり（通常）：
  `spawn` は「`expect` 管理下でコマンドを実行」だよね
  `USERNAME` 変数には `midori` が入っているから
  これは `passwd midori` を実行してくれるんだ！
しげる（通常）：
  `passwd` の引数にユーザ名を指定すると
  そのユーザのパスワードを変更するよ
  つまり `passwd midori` で
  `midori` ユーザのパスワード変更なんだ
  これで `passwd` コマンドが
  `expect` の管理下で実行されるよ
しげる（通常）：
  さて、その次の行はどうだろう？

```expect
expect "New password:"
```

みどり（通常）：
  `expect` は「管理下のコマンドが指定された文字列を出力するまで待機」だったね
  `passwd` が「New Password:」という文字列を出力するまで待機するんだ！
しげる（通常）：
  そういうことだね！
  待ち受けメッセージが表示されてから
  パスワード入力を受け付けるので
  それが表示されるまでは待機しているんだ
しげる（通常）：
  さらにその次はどうかな？

```expect
send "$USERNAME\r"
```

みどり（通常）：
  `send` は「管理下のコマンドに文字列を送信」だったね
  `USERNAME` 変数の値 `midori` を送って…
みどり（通常）：
  えっと…
  最後の `\r` はなんだろうね？
しげる（通常）：
  これは `expect` で「改行」を表す記号だよ
みどり（通常）：
  なるほど！
  それなら「New Password:」と
  待ち受けメッセージが表示された後に
  文字列 `midori` と「改行」を送信しているんだ！
しげる（通常）：
  そうそう！
  これで最初の「New Password:」の
  入力を自動化しているんだ
しげる（通常）：
  次の2行もこれまでと同じ挙動だね

```expect
expect "Retype new password:"
send "$USERNAME\r"
```

みどり（通常）：
  うん！
  入力パスワード確認も
  同様に自動化しているんだね！
しげる（通常）：
  次で `expect` スクリプトの記述は最後だね

```expect
wait
```

みどり（通常）：
  「New password:」と「Retype new password:」に対して
  自動でパスワードを入力した後
  `passwd` が終了するまで待機しているんだ！
しげる（通常）：
  おつかれさま！
  これで `expect` を使った
  `passwd` の対話の自動化が終わりだよ

## まとめ

みどり（通常）：
  今回は `expect` を使って
  対話的コマンドの対話自動化を学んだよ！
しげる（通常）：
  対話的なコマンドは入力リダイレクトや
  パイプから自動化できる場合があるよ

```bash
yes | 対話的コマンド
```

しげる（通常）：
  `expect` はそのような入力を拒否する対話的コマンドでも
  対話を自動化できるようにしてくれるんだ！

