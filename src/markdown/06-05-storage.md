chapter=6
story=5
title=ストレージ
keyword=storage
keyword=df
keyword=du
prev=6/4/
prev-title=メモリ
next=6/6/
next-title=ポート

# ストレージ

みどり（通常）：
  前回はメモリリソースの
  調べ方を教えてもらったね！
しげる（通常）：
  今回はストレージリソースを
  確認する方法を見ていこう！

## `df` コマンド

しげる（通常）：
  `df` は
  ストレージ全体の
  状況を表示するよ
  disk free の略なんだ

```bash
df [オプション]... [ファイル]...
```

オプション               | 役割
------------------------ | ----
`-h`, `--human-readable` | 人間に読みやすい形式で表示

しげる（通常）：
  `-h` オプションを指定して
  実行してみよう！

```bash
df -h
```

みどり（通常）：
  うん！

```console
Filesystem      Size  Used Avail Use% Mounted on
udev            3.9G     0  3.9G   0% /dev
tmpfs           806M  6.9M  799M   1% /run
/dev/nvme0n1p2  470G   36G  410G   8% /
tmpfs           4.0G     0  4.0G   0% /dev/shm
tmpfs           5.0M   32K  5.0M   1% /run/lock
/dev/nvme0n1p1  510M   63M  448M  13% /boot/firmware
tmpfs           806M   16K  806M   1% /run/user/1000
```

みどり（通常）：
  ストレージごとに
  総容量、使用容量、空き容量などを
  出してくれるんだね
みどり（笑顔）：
  空き領域のパーセント表記も
  わかりやすくて親切だよ
  これでどの領域に空きが無いのか
  一目でわかるね！

## `du` コマンド

しげる（通常）：
  `du` は
  各ディレクトリの
  使用容量を表示するよ
  disk usage の略なんだ

```bash
du [オプション]... [ファイル]...
```

オプション               | 役割
------------------------ | ----
`-a`, `--all`            | ディレクトリだけでなくファイルの使用容量も表示する
`-s`, `--summarize`      | サマリー（最後の1行）だけを表示する
`-h`, `--human-readable` | 人間に読みやすい型式で数値を表示する

しげる（通常）：
  自分のホームディレクトリが
  どれだけ容量を使っているか
  確認してみよう！

```bash
du -ah ~
```

みどり（通常）：
  どれどれ…

```console
4.0K    /home/midori/.vim/.netrwhist
8.0K    /home/midori/.vim
4.0K    /home/midori/.bash_logout
4.0K    /home/midori/.ssh/authorized_keys
8.0K    /home/midori/.ssh
4.0K    /home/midori/.profile
0       /home/midori/.sudo_as_admin_successful
8.0K    /home/midori/.bash_history
4.0K    /home/midori/.bashrc
4.0K    /home/midori/.viminfo
4.0K    /home/midori/.config/procps
8.0K    /home/midori/.config
4.0K    /home/midori/.lesshst
56K     /home/midori
```

みどり（通常）：
  ファイルやディレクトリごとに
  使用容量がわかるんだね！
  使用容量合計だけ知りたいなら
  `-s` オプションがよさそう！

## まとめ

みどり（通常）：
  今回はストレージリソース状況を
  確認する方法を学んだよ！
  `df` や `du` で状況を調べられるんだね！
しげる（通常）：
  ストレージが不足すると
  データ書き込みエラーが発生したり
  不完全なファイルができてしまうことがあるんだ
しげる（通常）：
  このような状態になったら
  不要ファイルを削除して容量を空けよう！

