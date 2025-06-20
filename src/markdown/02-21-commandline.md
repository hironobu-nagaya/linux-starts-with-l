chapter=2
story=21
title=コマンドライン
keyword=commandline
keyword=command
keyword=option
keyword=argument
prev=2/20/
prev-title=ファイル編集
next=2/22/
next-title=オプション

# コマンドライン

しげる（通常）：
  今回はいつも入力している
  コマンドを詳しく見ていこう！
みどり（通常）：
  実行して動いてくれたら
  それ以上はあまり意識しないよね
  ちゃんと「コマンド」を
  見直すのは大事だと思う！

## 構造

しげる（通常）：
  いつも入力している1行のコマンドを
  「コマンドライン(command line)」と呼ぶんだ
  コマンドラインは3つの要素から構成されるよ

コマンドラインの要素 | 役割
-------------------- | ----
コマンド(command)    | 実行するプログラムの指定
オプション(option)   | コマンドの動作変更
引数(argument)       | コマンドの対象

しげる（通常）：
  「コマンド」「オプション」「引数」
  コマンドラインはこの順番で並ぶんだ
しげる（通常）：
  「オプション」と「引数」の並びが前後しても
  親切に解釈してくれるコマンドも多いけど
  正しくはこの順番だと覚えておこう！
みどり（通常）：
  `ls -l /` と `ls / -l` は
  どちらもちゃんと動くけど
  正しく書くのなら
  前者の `ls -l /` なんだね！

## コマンドラインをまとめる

しげる（通常）：
  通常は改行でコマンドラインの終了だけど
  「セミコロン(`;`)」でも終了を表せるんだ
みどり（通常）：
  改行で十分だと思うけど…
  「セミコロン(`;`)」を使うと
  何が便利なのかな？
しげる（通常）：
  短いコマンドを
  1行にまとめたいときに便利だよ
  以下の2つの例は同じ動作をするんだ

```bash
!1
!2
!3
```

```bash
!1; !2; !3
```

みどり（驚き）：
  おお！
  短い記述ならこうやって
  簡潔にまとめられるんだね！

## コマンドラインを分割する

しげる（通常）：
  コマンドラインの末尾に
  「バッククォート(`\`)」を付けると
  コマンドラインはその行で終わらず
  次の行へ続けられるんだ
みどり（通常）：
  それはどういうときに
  使うのかな？
しげる（通常）：
  オプションや引数が長くなるときに
  読みやすくするために使われるよ
  以下の2つの例は同じ動作をするんだ

```bash
touch very-long-name-diary very-long-name-poet very-long-name-memo
```

```bash
touch \
    very-long-name-diary \
    very-long-name-poet \
    very-long-name-memo
```

みどり（驚き）：
  おおっ！
  確かに読みやすい！

## まとめ

みどり（通常）：
  「コマンド」「オプション」「引数」！
  コマンドラインはこの順に並ぶことを学んだよ！
  また複数のコマンドラインを1行にまとめたり
  1行のコマンドラインを複数行に分割できることも知ったよ
しげる（通常）：
  コマンドラインが正しい順番に並んでいたり
  見やすいようまとめたり分割することは
  他人にコマンドを読んでもらうときなどで大事だよ！

