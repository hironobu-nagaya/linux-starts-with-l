chapter=3
story=29
title=ANSIエスケープシーケンス
keyword=shell script
keyword=ANSI escape sequences
keyword=echo
prev=3/28/
prev-title=execコマンド
next=3/30/
next-title=expectコマンド

# ANSI エスケープシーケンス

みどり（通常）：
  お兄ちゃん！
  `ls` や `grep` などの出力に
  色が使われていることがあるよね？
  私のスクリプトでも色を使えないかな？
しげる（通常）：
  もちろんできるよ！
  今回は
  「ANSI エスケープシーケンス
  (ANSI escape sequences)」
  を学ぼう！

## 使い方

しげる（通常）：
  「ANSI エスケープシーケンス」は
  画面の制御などを
  文字列で表したものだよ
みどり（通常）：
  例えば「緑色にする」という
  意味を表す文字列を書けば
  文字が緑色になるのね！
しげる（通常）：
  そういうことだね
  主に色に関係する
  ANSI エスケープシーケンスを
  見てみよう！

ANSI エスケープシーケンス | 役割
------------------------- | ----
`\e[30m`                  | 文字色を黒で表示
`\e[31m`                  | 文字色を赤で表示
`\e[32m`                  | 文字色を緑で表示
`\e[33m`                  | 文字色を黄で表示
`\e[34m`                  | 文字色を青で表示
`\e[35m`                  | 文字色をマゼンタで表示
`\e[36m`                  | 文字色をシアンで表示
`\e[37m`                  | 文字色を白で表示

ANSI エスケープシーケンス | 役割
----------                | ----
`\e[40m`                  | 背景色を黒で表示
`\e[41m`                  | 背景色を赤で表示
`\e[42m`                  | 背景色を緑で表示
`\e[43m`                  | 背景色を黄で表示
`\e[44m`                  | 背景色を青で表示
`\e[45m`                  | 背景色をマゼンタで表示
`\e[46m`                  | 背景色をシアンで表示
`\e[47m`                  | 背景色を白で表示

ANSI エスケープシーケンス | 役割
----------                | ----
`\e[0m`                   | 指定をリセット
`\e[1m`                   | 文字を太字で表示
`\e[2m`                   | 淡い色で表示
`\e[3m`                   | 文字をイタリックで表示
`\e[4m`                   | 文字をアンダーラインで表示
`\e[5m`                   | 文字を点滅で表示
`\e[6m`                   | 文字を高速点滅で表示
`\e[7m`                   | 文字色と背景色を反転させて表示
`\e[8m`                   | 文字を非表示

みどり（笑顔）：
  色だけに色々あるんだね！
しげる（通常）：
  これらの指定は
  数値を「セミコロン(`;`)」で
  区切ることで同時指定できるんだ
  例えば `\e[42;2m` は
  「淡い緑色の文字色」になるよ！

## 表示

しげる（通常）：
  エスケープシーケンスの解釈には
  `echo` の `-e` オプションを使うんだ
みどり（通常）：
  さっそくやってみるね！

```bash
echo -e "\e[32;2;1m緑色のみどりです！"
```

みどり（通常）：
  「緑、淡い色、太字」の
  3つを指定してみたけど
  どうなるかな…？

```console
!start-class-lime!緑色のみどりです！!end!
```

みどり（驚き）：
  おお！
  緑色で表示してくれた！

みどり（通常）：
  でも `echo` を実行した後の出力も
  緑色になっちゃっているね
しげる（通常）：
  それは「緑色で出力」という指定が
  生き続けているからだよ
  こういう場合は出力の最後で
  指定をリセットしてあげるといいよ

```bash
echo -e "\e[32;2;1m緑色のみどりです！\e[0m"
```

みどり（通常）：
  文字列の中に
  ANSI エスケープシーケンスを混ぜると
  読みにくくなっちゃうね
しげる（通常）：
  そういう場合は変数を使ったり
  `echo` を分割してあげよう

```bash
GREEN="\e[32;2;1m"
RESET="\e[0m"
echo -e "${GREEN}緑色のみどりです！${RESET}"
```

```bash
echo -en "\e[32;2;1m"
echo "緑色のみどりです！"
echo -en "\e[0m"
```

## まとめ

みどり（通常）：
  今回は ANSI エスケープシーケンスで
  画面の表示に
  色を付けられることを学んだよ！
しげる（通常）：
  他にもさらに細かな色の指定や
  カーソルの位置の操作など
  様々な端末操作を
  ANSI エスケープシーケンスで
  表現できるんだ
  エラーメッセージを目立つ赤色で
  表示して気づきやすくするなど
  シェルスクリプトでも役に立つ機能だよ！
しげる（通常）：
  また `reset` は
  ANSI エスケープシーケンスの
  指定も初期化してくれるよ
  指定を解除するのに便利なので
  一緒に覚えておこう！

