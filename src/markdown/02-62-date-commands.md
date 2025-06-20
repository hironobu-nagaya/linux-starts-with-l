chapter=2
story=62
title=日時関連コマンド
keyword=cal
keyword=date
prev=2/61/
prev-title=バイナリ関連コマンド
next=2/63/
next-title=数学関連コマンド
javascripts=date-commands.js

# 日時関連コマンド

みどり（通常）：
  Windows や macOS では
  当たり前にやっていたけど
  Linux でこれまでに
  やっていないものと言えば…
しげる（通常）：
  今回は日時に関する
  コマンドを見ていこう！
みどり（通常）：
  なるほど！
  カレンダーや時刻は
  扱っていなかったね！

## `cal` コマンド

しげる（通常）：
  `cal` は
  カレンダーを表示するよ
  calendar の略なんだ

```bash
cal [オプション]... [日時指定]
```

しげる（通常）：
  日時を指定しなければ
  本日のカレンダーを表示するよ
  引数なしで実行してみよう！

```bash
cal
```

みどり（通常）：
  いつも確認するわけじゃないけど
  確認できないと不便だよね！

```bash calendar
    December 2024   
Su Mo Tu We Th Fr Sa
 1  2  3  4  5 !start-class-revert! 6!end!  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31            
                    
```

みどり（通常）：
  まさにカレンダー！
  シンプルでわかりやすい表示だね！

## `date` コマンド

しげる（通常）：
  `date` は
  日時を表示するよ！

```bash
date [オプション]... [+書式]
```

みどり（通常）：
  日付も確認できるのなら
  時間も確認したいよね！

```bash date
Thu Dec 26 17:42:52 JST 2024
```

みどり（通常）：
  なるほど…
  こちらもシンプルでわかりやすいね！
しげる（通常）：
  `date` では出力の書式を指定できるんだ
  書式の詳細は `man` で確認できるよ

```bash
man date
```

みどり（通常）：
  書式を指定できると
  どんなことができるのかな？
しげる（通常）：
  ファイル名に日付を
  含めたい場合などに便利なんだ
  例えば以下のような感じだよ

```bash
touch "backup-$(date +%Y%m%d)"
```

みどり（驚き）：
  おおっ！
  `backup-!start-id-date-suffix!20241226!end!` というファイルができたよ！
  末尾に本日(!start-id-today!2024年12月26日!end!)を表す数字が付くんだね！

## まとめ

みどり（通常）：
  今回は日時に関するコマンド
  `cal` と `date` を学んだよ！
しげる（通常）：
  特に `date` の書式指定は
  紹介した例のように
  日付文字列の生成に便利なんだ！

