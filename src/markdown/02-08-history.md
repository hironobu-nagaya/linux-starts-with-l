chapter=2
story=8
title=履歴
keyword=history
prev=2/7/
prev-title=pushdとpopd
next=2/9/
next-title=補完

# 履歴

みどり（通常）：
  お兄ちゃん！
  なんでそんなに速く
  コマンドを打てるの？
  私より断然速いんだけど！
しげる（通常）：
  それはシェルの便利機能を
  使っているからだよ
  シェルは指示を受けるだけでなく
  便利機能を提供しているんだ
しげる（笑顔）：
  今回はそんな便利機能の一つ
  「履歴(history)」を紹介しよう！
みどり（通常）：
  シェルの便利機能かぁ…
  覚えてもっと速く
  操作できるようになりたい！

## 使い方

しげる（通常）：
  ではさっそく
  履歴を試してみよう！
しげる（通常）：
  まずは何でもいいので
  コマンドを実行してみてね
みどり（通常）：
  うん！
  実行したよ！
しげる（通常）：
  そうしたら次に
  「↑キー」を押してみよう
みどり（通常）：
  あっ！
  さっきのコマンドが出てきた！
しげる（通常）：
  シェルは過去のコマンドを
  覚えているんだ
  「↑キー」で前のコマンド
  「↓キー」で次のコマンド
  を呼び出すよ
みどり（驚き）：
  すごい！
  一度打ったコマンドは
  入力しなくても
  いいんだね！

## `history` コマンド

しげる（通常）：
  `history` は
  これまでの履歴を表示するよ

```bash
history
```

みどり（通常）：
  どれどれ？

```console
 1 passwd
 2 logout
 3 pwd
 4 cd ..
 5 ls
 ...
```

みどり（驚き）：
  わっ！
  これまで実行したコマンドが
  全部表示されたよ！
しげる（通常）：
  コマンド履歴の前に番号があるよね？
  3番のコマンドを実行したければ
  以下のように実行できるんだ

```bash
!3
```

みどり（通常）：
  「↑キー」は直近の履歴を
  呼び出すのに便利だけど
  `!番号` はしばらくたった履歴を
  呼び出すのに便利だね！

## まとめ

みどり（通常）：
  以前実行したコマンドは
  履歴から呼び出せると学んだよ！
  「↑キー」や `!番号` で
  呼び出せるんだ！
しげる（通常）：
  履歴はどんどん活用しよう！
  コマンドを速く打ち間違いなく
  実行できるよ！

