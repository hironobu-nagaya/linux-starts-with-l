chapter=6
story=9
title=バイナリログ
keyword=log
keyword=last
keyword=lastlog
keyword=lastb
keyword=dmesg
prev=6/8/
prev-title=ログ
next=6/10/
next-title=/runディレクトリ

# バイナリログ

みどり（驚き）：
  お兄ちゃん！
  `less` でログを開いたら
  「バイナリだけど開いていい？」
  って確認されたんだ！
みどり（通常）：
  バイナリは人間でなく
  コンピュータが読むためのものだよね？
  このログは何のためのものなのかな？
しげる（通常）：
  いくつかのログは
  バイナリで出力されているんだ
  これらは専用コマンドから確認するよ
しげる（笑顔）：
  今回はバイナリログの
  扱いについて学んでいこう！

## `last` コマンド

しげる（通常）：
  `last` は
  ログイン履歴を表示するよ
  ログファイルは `/var/log/lastw` なんだ

```bash
last [オプション]... [ユーザ名]... [端末名]...
```

しげる（通常）：
  そのまま `last` を
  実行してみよう！

```bash
last
```

みどり（通常）：
  実行するね！

```console
midori   pts/1        192.168.0.201    Fri Dec 27 12:32   still logged in
shigeru  pts/0        192.168.0.200    Fri Dec 27 12:24   still logged in
...
```

みどり（通常）：
  ログイン履歴が
  全部見れるんだ！
  ちょっと出力が長いね！
しげる（通常）：
  そうだね
  `less` で
  見るのもいいよ

```bash
last | less
```

みどり（通常）：
  最新のログは
  末尾ではなく
  先頭なんだね！
  `head` も良さそう！

```bash
last | head
```

## `lastlog` コマンド

しげる（通常）：
  `lastlog` は
  ユーザの最終ログイン日時を表示するよ
  ログファイルは `/var/log/lastlog` なんだ

```bash
lastlog [オプション]...
```

しげる（通常）：
  これもオプションなしで
  実行してみよう！

```bash
lastlog
```

みどり（通常）：
  うん！

```console
Username         Port     From                                       Latest
root                                                                **Never logged in**
...
shigeru          pts/0    192.168.0.200                             Fri Dec 27 12:24:54 +0900 2024
midori           pts/1    192.168.0.201                             Fri Dec 27 12:32:23 +0900 2024
```

みどり（通常）：
  ユーザの数だけしか
  行数がないから
  短くて見やすいね！
しげる（通常）：
  最終ログイン時刻や
  ログインの有無を
  確認するのに便利だよ
みどり（通常）：
  `su` とか `sudo` を使ったけど
  `root` ユーザは
  「ログインしていない
  (Never logged in)」
  なんだね？
しげる（通常）：
  「ユーザ切り替え」は
  「ログイン」でないからね
  これらの操作は
  `lastlog` には
  記録されないんだ

## `lastb` コマンド

しげる（通常）：
  `lastb` は
  ログイン失敗記録を表示するよ
  ログファイルは `/var/log/lastb` なんだ

```bash
lastb [オプション]... [ユーザ名]... [端末名]...
```

しげる（通常）：
  セキュリティに関する内容なので
  スーパユーザのみ閲覧できるんだ
  `sudo` と一緒に実行しよう！

```bash
sudo lastb
```

みどり（通常）：
  これも実行するよ！

```console
jxt      ssh:notty    144.144.144.144  Sun Dec  1 00:01 - 00:01  (00:00)
freddy   ssh:notty    88.88.88.88      Sun Dec  1 00:00 - 00:00  (00:00)
...
```

みどり（通常）：
  わぁ！
  すごいたくさん
  失敗しているね！
しげる（通常）：
  外部からのリモート接続を
  許可している場合は
  多くの試行の失敗が記録されるよ
  こういう場合は「公開鍵認証」など
  安全な認証のみ許すようにして
  不正アクセスの対策をしよう

## `dmesg` コマンド

しげる（通常）：
  `dmesg` は
  カーネルのログを閲覧するよ
  ログはカーネルが
  保持しているんだ

```bash
dmesg [オプション]...
```

しげる（通常）：
  これもオプションなしで
  実行してみよう

```bash
dmesg
```

```console
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x414fd0b1]
[    0.000000] Linux version 6.6.51+rpt-rpi-2712 (serge@raspberrypi.com) (gcc-12 (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT Debian 1:6.6.51-1+rpt3 (2024-10-08)
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Raspberry Pi 5 Model B Rev 1.0
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x0000000002000000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000002000000..0x0000000005ffffff (65536 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x0000000000000000..0x000000000007ffff (512 KiB) nomap non-reusable atf@0
...
```

みどり（通常）：
  起動直後の
  メッセージが大半だね！
しげる（通常）：
  そうだね
  「起動時に特定の機能が有効になったか」など
  起動直後の動きの確認などに使われるよ

## まとめ

みどり（通常）：
  今回はバイナリ形式のログを
  閲覧するコマンドを学んだよ！
  `last`, `lastlog`, `lastb`, `dmesg`
  などがあるんだ！

コマンド  | ログファイル       | 内容
--------- | ------------------ | ----
`last`    | `/var/log/lastw`   | ログイン履歴
`lastb`   | `/var/log/lastb`   | ログイン失敗履歴
`lastlog` | `/var/log/lastlog` | 最終ログイン日時
`dmesg`   | (カーネルが保持)   | カーネル動作

しげる（通常）：
  バイナリ形式のログにも
  重要な情報が載っているんだ
  テキストとバイナリの両方のログを
  確認できるようにしておこう！

