chapter=3
story=17
title=readonlyコマンド
keyword=shell script
keyword=readonly
prev=3/16/
prev-title=オプション処理
next=3/18/
next-title=exportコマンド

# `readonly` コマンド

みどり（通常）：
  お兄ちゃん！
  変数の値ってどこでも
  書き換えられる可能性があるよね？
  これを書き換えられないようにできないかな？
しげる（通常）：
  もちろんできるよ！
  今回は
  「読み取り専用変数
  (readonly variable)」
  について学ぼう！

## 使い方

しげる（通常）：
  `readonly` は
  読み取り専用変数を
  宣言するよ

```bash
readonly [オプション]... [変数名[=値]]...
```

みどり（通常）：
  へぇ…
  思っていたより
  簡単にできるんだね！

## 実践

みどり（通常）：
  ねぇ！
  さっそく試してみようよ！
しげる（通常）：
  では `NAME` 変数を
  読み取り専用で宣言してみよう
  以下のようにしてみてね

```bash
readonly NAME=みどり
```

みどり（通常）：
  うん！
  実行したよ！
しげる（通常）：
  読み取り専用変数は
  値を読むことはできるよ
  その確認をしてみよう

```bash
echo "$NAME"
```

みどり（通常）：
  普通の変数と
  使い方は同じだね

```console
みどり
```

しげる（通常）：
  普通の変数との違いは
  変更ができないことなんだ
  以下のように値を
  変更してみようか

```bash
NAME=しげる
```

みどり（通常）：
  やってみるね！

```console
-bash: NAME: readonly variable
```

みどり（驚き）：
  おおっ！
  「`NAME` は読み込み専用だぞ！」
  と怒られたよ
しげる（通常）：
  また変数の削除も
  できなくなるんだ
しげる（通常）：
  `unset` は
  定義済みの変数を
  未定義に戻すよ
しげる（通常）：
  以下を実行してみよう

```bash
unset NAME
```

みどり（通常）：
  こちらも
  やってみる！

```console
-bash: unset: NAME: cannot unset: readonly variable
```

みどり（通常）：
  こちらも怒られたよ
  削除もできないんだね
しげる（通常）：
  不用意に読み込み専用変数を作ると
  後で消せずに困ることになるよ
  必要なものだけ読み込み専用変数に
  してあげよう！

## 確認

しげる（通常）：
  `readonly` を
  引数なしで実行すると
  宣言された読み取り専用変数を
  一覧表示してくれるよ

```bash
readonly
```

みどり（通常）：
  これで読み取り専用変数の
  確認ができるんだね！

## まとめ

みどり（通常）：
  今回は読み取り専用変数を学んだよ！
  `readonly` で実現できるんだ！
しげる（通常）：
  シェル上よりもシェルスクリプト内で
  使われることが多い記述だよ
  シェルスクリプト内で読み取り専用変数を宣言しても
  シェルスクリプトが終了すると一緒に無くなるんだ
  シェルスクリプト内で書き換えて欲しくない値は
  読み取り専用変数にしてしまおう！

