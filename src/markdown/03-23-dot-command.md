chapter=3
story=23
title=ドットコマンド
keyword=shell script
keyword=dot command
prev=3/22/
prev-title=シェル関数
next=3/24/
next-title=setコマンド

# ドットコマンド

みどり（通常）：
  お兄ちゃん！
  自作スクリプトは関数を使って読みやすくなったけど
  そもそもの記述量が減っていないから
  分量が多くてやっぱり大変だよ！
しげる（通常）：
  それなら今回はドットコマンド `.` を学ぼう！
みどり（驚き）：
  `.` だけでコマンドなんだ？
  それってどういうものなの？

## 使い方

しげる（通常）：
  ドットコマンド `.` は
  他のファイルに書かれた内容を読み込むよ

```bash
. 読み込むファイルのパス
```

みどり（通常）：
  指定されたファイルの内容が
  その場にあるかのように使えるんだね
  読み込むファイルに何か特別な設定は必要？
しげる（通常）：
  実行権限は不要だけど読み込み権限は必要だよ

## 実践

しげる（通常）：
  ドットコマンド `.` を使えば
  スクリプトを複数のファイルに
  分割して管理できるんだ
しげる（通常）：
  例えば以下のような
  スクリプトがあったとしよう

```
#!/bin/bash

!start-class-silver!# 変数設定!end!
A=...
B=...
C=...

!start-class-silver!# 関数定義!end!
function x() {
  ...
}

function y() {
  ...
}

function z() {
  ...
}

!start-class-silver!# 変数や関数を使った処理!end!
...
```

みどり（通常）：
  変数や関数が増えたら
  このファイルの内容はすぐに膨れ上がりそうだね
  実際私のスクリプトはそんな感じになっちゃったよ
しげる（通常）：
  そこでこれらを別ファイルに分けて
  必要な時に読むようにすると便利なんだ
  例えば以下のように分割して管理できるよ

**variables**

```bash
!start-class-silver!# 変数設定!end!
A=...
B=...
C=...
```

**functions**

```bash
!start-class-silver!# 関数定義!end!
function x() {
  ...
}

function y() {
  ...
}

function z() {
  ...
}
```

**script**

```bash
#!/bin/bash

!start-class-silver!# 他のファイルを読み込む!end!
. ./variables
. ./functions

!start-class-silver!# 変数や関数を使った処理!end!
...
```

みどり（通常）：
  それぞれのファイルは
  役割ごとに内容がまとまっていて
  分量が少なく読みやすくなったね！
しげる（通常）：
  ファイルを細かく分けすぎると
  逆に管理が煩雑になることがあるんだ
  自分が使いやすい粒度で分割するのがポイントだよ

## `source` コマンド

しげる（通常）：
  ドットコマンド`.` と同じ動きをするものに
  `source` があるんだ
みどり（通常）：
  同じ動きなんだけど二つコマンドがあるんだ？
しげる（通常）：
  `.` は短く書けるけど見落としやすいんだ
  `.` と書く人が多い印象だけど
  `source` を使う人も一定数いるよ
みどり（通常）：
  どちらを使っても良いんだね！

## まとめ

みどり（通常）：
  今回はドットコマンド `.` や `source` で
  他のファイルの内容を読み込めることを学んだよ！
しげる（通常）：
  スクリプトが大きくなって管理しづらくなった時は
  スクリプトを分割することを考えよう
  個々のスクリプトは短くなるので
  内容を把握しやすくなるよ！

