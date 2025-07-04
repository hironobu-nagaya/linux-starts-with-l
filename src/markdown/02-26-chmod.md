chapter=2
story=26
title=パーミッション操作
keyword=chmod
keyword=symbolic
keyword=octal
prev=2/25/
prev-title=パーミッション
next=2/27/
next-title=リンク

# パーミッション操作

みどり（通常）：
  お兄ちゃん！
  パーミッションを
  見れるのはわかったけど
  設定はどうやって
  すればいいのかな？
しげる（通常）：
  今回はパーミッションの
  変更を学んでいこう！

## `chmod` コマンド

しげる（通常）：
  `chmod` は
  パーミッション変更を行うよ
  change mode の略なんだ

```bash
chmod [オプション]... 指定 ファイル...
```

オプション        | 役割
----------------- | ----
`-v`, `--verbose` | 動作内容を表示
`-c`, `--changes` | 変更内容を表示

みどり（通常）：
  「指定」は
  どうするのかな？
しげる（通常）：
  主に二つの指定の仕方があるんだ
  「シンボリック(symbolic)形式」
  「オクタル(octal)形式」と呼ぶよ

## シンボリック形式による指定

しげる（通常）：
  シンボリック形式は
  「対象」「どうするか」「権限」の
  3種類の文字を組み合わせて
  指定を表現する方法だよ

対象 | 意味
---- | ----
`u`  | 所有ユーザ(user)
`g`  | 所有グループ(group)
`o`  | その他(other)
`a`  | 全員(all)

どうするか | 意味
---------- | ----
`+`        | 権限を与える
`-`        | 権限を除く
`=`        | 権限を設定する

権限 | 意味
---- | ----
`r`  | 読み込み(read)
`w`  | 書き込み(write)
`x`  | 実行(execute)

しげる（通常）：
  いくつか例を示すね

指定    | 意味
------- | ----
`a+x`   | 全員に実行権限を与える
`o-wx`  | その他のユーザから書き込みと実行権限を除く
`ug=rw` | 所有ユーザと所有グループに読み書き権限を設定する

みどり（通常）：
  なんとなくわかったけど…
  ちょっと練習が必要そうだね

## オクタル形式による指定

しげる（通常）：
  「オクタル(octal)」は
  八進数という意味なんだ
  3桁の八進数で指定を表すよ

桁    | 意味
----- | ----
3桁目 | 所有ユーザ
2桁目 | 所有グループ
1桁目 | その他

数値 | 意味
---- | ----
`4`  | 読み込み
`2`  | 書き込み
`1`  | 実行

しげる（通常）：
  例えば「読み書き」権限は
  「読み込み(`4`)」と
  「書き込み(`2`)」を
  足した `6` になるよ
しげる（通常）：
  これもいくつか例を示すね

指定  | 意味
----- | ----
`777` | 全員に読み書き実行権限を設定
`755` | 所有ユーザに読み書き実行権限、所有グループやその他には読み込み権限と実行権限を設定
`644` | 所有ユーザに読み書き権限、所有グループやその他には読み込み権限を設定

みどり（通常）：
  シンボリック形式は
  一部変更の指定に便利だけど
  オクタル形式は
  一括指定に便利だね

## まとめ

みどり（通常）：
  今回はパーミッションの変更を学んだよ！
  `chmod` で変更の指定をするんだ
みどり（通常）：
  例えばファイルを実行できるようにするには
  以下のように指定してあげればいんだね

```bash
chmod a+x my-program
```

しげる（通常）：
  パーミッションを変更できるのは
  自分のファイルだけだから注意してね
  他人のファイルのパーミッションを
  変更するのは管理者の仕事なんだ

