chapter=6
story=18
title=S-nail
keyword=S-nail
keyword=MUA
prev=6/17/
prev-title=Postfix
next=7/1/
next-title=Raspberry Pi

# S-nail

みどり（通常）：
  前回は MTA である Postfix を
  設定して起動したよ！
しげる（通常）：
  MTA に対してメールクライアントソフトを
  「MUA(mail user agent)」とよぶよ
  Linux の MUA は伝統的に
  `mail`, `mailx`, `nail` などなんだ
  今回はこれらの操作を引き継いだ MUA の
  S-nail を使ってメールを送受信してみよう！

## インストール

しげる（通常）：
  S-nail のパッケージ名は `s-nail` だよ
  パッケージ管理システムから
  インストールしよう

```bash
sudo apt install -y s-nail
```

みどり（通常）：
  うん！
  インストールしたよ！

## メール送信

しげる（通常）：
  以下のようにして
  メールを送信するよ

```bash
s-nail -s 件名 ユーザ
```

しげる（通常）：
  以下のようにして
  僕へメールを送ってみてね

```bash
s-nail -s "テスト送信" shigeru
```

みどり（通常）：
  うん！

```console
To: shigeru
Subject: テスト送信
!cursor!
```

みどり（通常）：
  なるほど！
  ここに本文を
  書いていけばいいのね！
しげる（通常）：
  終了は Ctrl + D か
  `~.` と入力だよ

```bash
-------
(Preliminary) Envelope contains:
To: shigeru
Subject: テスト送信
Send this message [yes/no, empty: recompose]? !cursor!
```

みどり（通常）：
  最後の行は
  「メッセージを送りますか？」だね！
  `yes` で送信されるということだね！
しげる（通常）：
  うん
  省略形の `y` だけでもいいんだ
みどり（通常）：
  プロンプトが返ってきたよ
  これでメール送信完了なんだね！
しげる（通常）：
  入力リダイレクトやパイプなどを使って
  入力を与えると非対話的な動作になるよ

```bash
s-nail -s "テスト送信" shigeru << \EOF
テスト送信の本文です！
EOF
```

# メール閲覧

しげる（通常）：
  メール閲覧は `s-nail` を
  そのまま実行しよう！

```bash
s-nail
```

みどり（通常）：
  うん！

```console
s-nail version v14.9.24.  Type `?' for help
/var/mail/midori: 1 message 1 new
▸N  1 shigeru@localhost 2025-01-18 17:24   18/638   兄より
? !cursor!
```

みどり（通常）：
  あっ！
  お兄ちゃんから
  メールが届いている！
しげる（通常）：
  対話的動作の `s-nail` では
  以下のコマンドを受け付けるんだ

コマンド      | 省略形   | 説明
------------- | -------- | ----
`headers`     | `h`      | メール一覧
`next`        | `n`      | 次のメール
`delete`      | `d`      | メール削除
`reply`       | `r`      | メール返信
`Reply`       | `R`      | メール返信(送り主だけ)
`quit`        | `q`      | 変更を保存して終了
`xit`, `exit` | `x`, `e` | 変更を破棄して終了
`?`           | `?`      | ヘルプを表示

しげる（通常）：
  `数字` を入れると
  その番号のメールが表示されるよ
  何も入力せず Enter を押すと
  今見ているメール(`▸`) を表示するんだ
みどり（通常）：
  じゃあ　Enter だけ入力するね

```console
Date: Sat, 18 Jan 2025 17:24:48 +0900
To: midori@localhost
Subject: テスト送信
Message-Id: <20250118082448.BFFA11F5CF5@localhost>
From: shigeru@localhost

おめでとう！
コマンドだけでメールを見れるようになったんだね
メール送信機能を持つデーモンもあるし
シェルスクリプトからメールを送信してもいいんだ
何か問題が発生したらメール送信するようにしておくと
問題の早期発見に役に立つよ！
```

### メール通知

みどり（通常）：
  メールが届いていたら
  お知らせがあると助かるなぁ
しげる（通常）：
  以下のオプションで
  メール確認ができるよ

オプション | 役割
---------- | ----
`-e`       | メールボックスにメールがあるかを確認。あるなら成功、ないなら失敗
`-H`       | メール一覧を表示

しげる（通常）：
  `~/.bashrc` に書いておけば
  ログインのたびに通知を出せるんだ
みどり（通常）：
  `-e` オプションは
  全て既読でもメールがあれば
  成功になっちゃうんだね
  新着や未読メールが
  あることを知りたい場合は
  どうすればいいのかな？
しげる（通常）：
  メール一覧の出力から判断しよう
  以下のようなコマンドはどうかな？

```bash
s-nail -H | grep -sqm1 '^[▸ ][NU]' \
    && echo "新着/未読メールがあります！"
```

みどり（通常）：
  お兄ちゃん、ありがとう！
  これを `~/.bashrc` に書いて置くよ！

## まとめ

みどり（通常）：
  今回は S-nail を扱ったよ！
  メール送受信をしてくれるんだ！
しげる（通常）：
  他にも以下のような MUA があるよ
  自分の使いやすい MUA でメールを扱おう！

* `procmail`
* `fetchmail`
* `mutt`

