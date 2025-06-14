chapter=2
story=2
title=ログイン
keyword=CUI
keyword=login
keyword=prompt
keyword=shell
prev=2/1/
prev-title=Linux
next=2/3/
next-title=passwdとlogout

# ログイン

しげる（通常）：
  みどりが触れるように
  Linux を準備をしておいたよ！
みどり（通常）：
  ありがとう！
  いよいよ操作するんだね！

```console
login: !cursor!
```

みどり（驚き）：
  真っ黒な画面に
  「login:」だけ…
  もしかしてこれが
  ログイン画面？
しげる（通常）：
  そう
  ログイン画面だよ
みどり（通常）：
  なんだか味気ないね
しげる（通常）：
  Windows や macOS のように
  マウスやアイコンなどが主体の操作を
  「GUI(Graphical User Interface)」と呼ぶよ
しげる（通常）：
  一方、キーボードや文字などが主体の操作を
  「CUI(Character User Interface)」と呼ぶんだ
みどり（通常）：
  つまりこれは
  GUI じゃなく
  CUI なんだね！
しげる（通常）：
  Linux にも
  GUI があるけど
  基本は CUI だよ
  使い方は教えるから
  頑張ってついてきてね！
みどり（笑顔）：
  一人で使うのは
  無理そうだけど…
  お兄ちゃんが
  教えてくれるなら
  きっと大丈夫！
みどり（通常）：
  早速なんだけど…
  ここからどうやって
  操作するのかな？
しげる（通常）：
  まずはログインから始めよう！
  みどり用ユーザ `midori` を
  作っておいたよ
  `midori` と入力して
  Enter を押してみて

```console
login: midori!cursor!
```

みどり（通常）：
  こう入力してから
  Enter ね！

```console
Password:
```

みどり（通常）：
  次は
  「Passowrd:」
  って出てきたよ！
  これはパスワードを
  入力するのかな？
しげる（通常）：
  あっているよ
  パスワードも `midori` にしてあるから
  入力して Enter を押して進んでね
みどり（通常）：
  あれ？
  文字が出てこないよ？
しげる（通常）：
  大丈夫！
  パスワード入力中は
  文字が表示されないんだ
  覗き見防止のためなんだよ
しげる（通常）：
  ちゃんと入力されているから
  安心して続けてみて
みどり（通常）：
  そうなんだ
  表示が無いと
  ちょっと不安だけど…

```console
（色々な出力）
$ !cursor!
```

みどり（通常）：
  画面に文字が
  「だーっ」と流れて…
  フリーズしちゃった？
しげる（通常）：
  ちゃんとログインできてるよ
  画面の下の方を見てごらん
  「`$`」って記号があるよね？
みどり（通常）：
  うん！
  カーソルの前にあるね！
しげる（通常）：
  これは「プロンプト(prompt)」というよ
  「指示を待っています」
  という記号なんだ
みどり（笑顔）：
  ということは…
  ここから Linux を
  操作できるんだね！
しげる（通常）：
  このプロンプトを表示して
  入力を受け付けるプログラムを
  「シェル(shell)」と呼ぶよ
しげる（通常）：
  シェルには色々な種類があるけど
  Linux では `bash` が標準的なんだ
  たびたび登場するので覚えておこう
  以降、特に断りがなければ
  シェルは `bash` という
  前提で話を進めるね

## まとめ

みどり（通常）：
  今回は Linux への
  ログインを学んだよ！
  ログインは「ユーザ名」と
  「パスワード」を入力するんだ！
  ログイン後は「シェル」が起動して
  「プロンプト」を表示してくれるよ
しげる（通常）：
  このような認証は
  「パスワード認証」と呼ばれるよ
  最も基本的な認証だから
  慣れておこう！

