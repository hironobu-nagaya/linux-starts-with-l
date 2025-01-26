chapter=5
story=3
title=ロケール
keyword=locale
keyword=lang
prev=5/2/
prev-title=エイリアス
next=5/4/
next-title=dircolorsコマンド
javascripts=locale.js

# ロケール

みどり（通常）：
  お兄ちゃん！
  Linux がこんなに広まっているなら
  多言語対応とかないのかな？
しげる（通常）：
  もちろんあるよ！
  そのような言語対応を
  「ロケール(locale)」というんだ
  今回はロケールを見ていこう！

## `locale` コマンド

しげる（通常）：
  `locale` は
  ロケールの設定を
  表示するよ

```bash
locale [オプション]...
```

オプション    | 役割
------------- | ----
`-a`, `--all` | 設定可能なロケールを一覧表示

しげる（通常）：
  オプションを指定しないと
  現在のロケール設定を
  表示するよ
  実行してみよう！

```bash
locale
```

みどり（通常）：
  どれどれ？

```bash
LANG=ja_JP.utf8
LC_CTYPE="ja_JP.utf8"
LC_NUMERIC="ja_JP.utf8"
LC_TIME=POSIX
LC_COLLATE="ja_JP.utf8"
LC_MONETARY="ja_JP.utf8"
LC_MESSAGES=POSIX
LC_PAPER="ja_JP.utf8"
LC_NAME="ja_JP.utf8"
LC_ADDRESS="ja_JP.utf8"
LC_TELEPHONE="ja_JP.utf8"
LC_MEASUREMENT="ja_JP.utf8"
LC_IDENTIFICATION="ja_JP.utf8"
LC_ALL=
```

みどり（通常）：
  設定がいっぱい
  あるんだね！
しげる（通常）：
  これらの環境変数を
  上書きすることで
  ロケールを変えられるよ
  大抵は `LC_` の後に続く単語の
  ロケールを設定しているんだ
  重要なのは一部だよ
みどり（通常）：
  `ja_JP.utf8` は
  日本語だなぁとわかるけど
  `POSIX` はどんな値なんだろう？
しげる（通常）：
  `POSIX` や `C` は
  多言語対応がなかった時代の
  英語表示を意味するよ

## 環境変数

しげる（通常）：
  一番良く設定されるのは
  `LANG` 環境変数だよ
  これは設定されていない場合の
  デフォルトのロケールを指定するんだ
みどり（通常）：
  じゃあ最低でも
  `LANG` 環境変数だけ
  設定しておけばいいんだね！
しげる（通常）：
  次は `LC_MESSAGES` 環境変数を見よう
  これはコマンドなどが出力する
  メッセージのロケールを指定するよ
みどり（通常）：
  この設定は日本語に
  していないんだ？
しげる（通常）：
  日本語のウェブ検索結果は少ないんだ
  出力メッセージを英語で
  検索できるようにするため
  あえて `POSIX` を設定しているよ
しげる（通常）：
  もう一つ押さえておきたいのは
  `LC_TIME` 環境変数だよ
  これは日時のロケールを
  指定しているんだ
みどり（通常）：
  これも日本語に
  していないんだね
しげる（通常）：
  `ls -l` のように
  日時が表示される機会は結構あるよ
  英文に日本語が混じって
  違和感を感じるので
  日本語にはしていないんだ
みどり（通常）：
  うーん…
  言葉だけだと
  よくわからないなぁ
しげる（通常）：
  実際に例を見てみよう
  以下は `LC_TIME` 変数を指定して
  `date` を実行した結果だよ

```bash
LC_TIME=ja_JP.utf8 date
```

```console ja-date
2025年  1月 15日 水曜日 17:49:32 JST
```

---

```bash
LC_TIME=POSIX date
```

```console date
Wed Jan 15 17:49:32 JST 2025
```

みどり（驚き）：
  おお！
  印象がずいぶんと違うね！

## 設定

みどり（通常）：
  これらのロケール設定は
  どうすればいいのかな？
しげる（通常）：
  `~/.bash_profile` に
  `export` を書いてあげよう！
  他のユーザに影響なく
  自分だけの言語設定ができるよ
しげる（通常）：
  以下は
  これまでの説明のような
  設定にする記述だよ

```bash
export LANG=ja_JP.utf8
export LC_MESSAGES=POSIX
export LC_TIME=POSIX
```

## まとめ

みどり（通常）：
  今回はロケールを学んだよ！
  デフォルト言語を
  `LANG` 環境変数に設定したあと
  上書きしたい環境変数だけを
  個別に設定すればいいんだ！
しげる（通常）：
  `LC_MESSAGES` と `LC_TIME` を
  `POSIX` にしているのは僕の好みだよ
  言語設定は自分が使いやすいよう
  好みに設定しよう！

