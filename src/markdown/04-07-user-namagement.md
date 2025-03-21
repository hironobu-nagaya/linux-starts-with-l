chapter=4
story=7
title=ユーザ管理
keyword=super user
keyword=root
keyword=useradd
keyword=passwd
keyword=usermod
keyword=userdel
prev=4/6/
prev-title=パッケージ管理
next=4/8/
next-title=グループ管理

# ユーザ管理

みどり（通常）：
  お兄ちゃん！
  私が Linux に初めて触れた時アカウントを用意してくれたよね？
  アカウント管理も管理者の仕事のような気がする！
しげる（通常）：
  そのとおり！
  今回はユーザを作る方法を覚えよう！

## `useradd` コマンド

しげる（通常）：
  `useradd` はユーザを追加するよ

```bash
useradd [オプション]... ユーザ名
```

オプション              | 役割
----------------------- | ----
`-m`                    | ホームディレクトリがなければ作成
`-d ホームディレクトリ` | ホームディレクトリを設定(デフォルトは `/home/ユーザ名`)
`-c コメント`           | コメントを設定
`-s シェル`             | シェルを設定
`-r`                    | システム用ユーザ作成

しげる（通常）：
  `midori` ユーザを作成したときには
  以下のようにコマンドを実行したよ

```bash
sudo useradd -m -c "Midori Wakagi" -s /bin/bash midori
```

しげる（通常）：
  ほとんどの場合ユーザ作成時にホームディレクトリも一緒に作成するよ
  意図的にそうするのでない限り `-m` オプションを付けているかどうか確認しよう
みどり（通常）：
  コメントには何を書いても良いの？
しげる（通常）：
  特に制限は無いよ
  一般的にはフルネームやメールアドレスが書かれることが多いね

## `passwd` コマンド

しげる（通常）：
  `midori` ユーザを作成した後は以下のように `passwd` を実行していたよ

```bash
sudo passwd midori
```

みどり（通常）：
  `passwd` の引数にユーザ名を指定するとそのユーザのパスワードを変更できるんだ！
しげる（通常）：
  自分のパスワードを変更はどのユーザでもできるけど
  他人のパスワード変更は root ユーザの役割だよ
みどり（通常）：
  こうやって最初に私のパスワードに `midori` を設定してくれていたんだよね
しげる（通常）：
  そういうことだね
  みどりが目の前にいてすぐにパスワードを変更をしてもらうつもりだから簡単なパスワードにしたけど
  通常は初期パスワードでも推測しにくいものにするよ

## まとめ

みどり（通常）：
  今回はユーザ追加の方法を学んだよ！
  ユーザの追加は `useradd` で行い、パスワード設定は `passwd` で行うんだね
しげる（通常）：
  他にもユーザ情報を変更する `usermod` や削除する `userdel` があるんだ
  これらのコマンドでユーザアカウントを管理できるよ

