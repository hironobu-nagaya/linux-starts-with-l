chapter=2
story=58
title=テキスト関連コマンド(その1)
keyword=sort
keyword=uniq
keyword=tac
keyword=rev
prev=2/57/
prev-title=awkコマンド
next=2/59/
next-title=テキスト関連コマンド(その2)

# テキスト関連コマンド(その1)

みどり（通常）：
  お兄ちゃん！
  コマンドを知れば知るほど
  操作の幅が広がるね！
  私がまだ知らないコマンドも
  たくさんあるんだよね？
しげる（通常）：
  うん、たくさんあるよ！
  今回はテキスト処理に関する
  コマンドを扱っていこう！

## `sort` コマンド

しげる（通常）：
  `sort` は
  各行を辞書順に並び替えるよ

```bash
sort [オプション]... [ファイル]...
```

しげる（通常）：
  以下を実行してみよう

```bash
sort << EOF
555
222
333
111
444
333
EOF
```

みどり（通常）：
  結果はこうだったよ！

```console
111
222
333
333
444
555
```

みどり（通常）：
  辞書順に並び替え…
  これはわかりやすいね！

## `uniq` コマンド

しげる（通常）：
  `uniq` は
  連続した重複行を取り除くよ

```bash
uniq [オプション]... [入力ファイル [出力ファイル]]
```

しげる（通常）：
  連続していない重複行は
  削除してくれないんだ
  なので `sort` と組み合わせて
  使われることが多いよ
しげる（通常）：
  先ほどの `sort` の例に
  `uniq` を加えてみよう！

```bash
sort << EOF | uniq
111
555
333
222
444
333
EOF
```

みどり（通常）：
  出力は以下のようになったよ！

```console
111
222
333
444
555
```

みどり（通常）：
  `sort` の出力では
  重複していた `333` が
  1行しか出力されていないのが
  わかるね！

## `tac` コマンド

しげる（通常）：
  `tac` は
  行の順序を逆さまにして表示するよ
  `cat` を逆さまにした名前なんだ

```bash
tac [オプション]... [ファイル]...
```

しげる（通常）：
  `tac` に
  ヒアドキュメントの内容を
  処理させてみよう！

```bash
tac << EOF
123
456
789
EOF
```

みどり（通常）：
  うん！
  実行してみる！

```console
789
456
123
```

みどり（驚き）：
  おお！
  確かに行が逆順になっている！

## `rev` コマンド

しげる（通常）：
  `rev` は
  各行の文字列を
  逆順にして表示するよ
  revert の略なんだ

```bash
rev [オプション] [ファイル]...
```

しげる（通常）：
  これは例を見た方が
  わかりやすいと思うよ

```bash
rev << EOF
123
456
789
EOF
```

みどり（通常）：
  じゃあ実行して
  結果を見てみよう！

```console
321
654
987
```

みどり（通常）：
  なるほど…
  各行の内容が逆になっているね！
みどり（驚き）：
  これって `tac` と組み合わせたら
  完全に逆さまになるんじゃないかな？
しげる（通常）：
  いい視点だね！
  試してみよう

```bash
rev << EOF | tac
123
456
789
EOF
```

みどり（通常）：
  どうなってくれるかな…

```console
987
654
321
```

みどり（笑顔）：
  ちゃんと期待どおり！
  全てが逆さまの表示になったね！

## まとめ

みどり（通常）：
  今回はテキストを処理するコマンド
  `sort`, `uniq`, `tac`, `rev` を学んだよ！
しげる（通常）：
  これらのコマンドはとてもシンプルだけど
  組み合わせ次第で色々なことができるんだ

