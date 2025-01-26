chapter=6
story=4
title=ストレージ
keyword=storage
keyword=df
keyword=du
prev=6/3/
prev-title=メモリ
next=6/5/
next-title=ポート

# ストレージ

みどり（通常）：
  前回はメモリリソースの調べ方を教えてもらったね！
しげる（通常）：
  今回はストレージリソースを確認する方法を見ていこう！

## `df` コマンド

しげる（通常）：
  `df` はストレージ全体の状況を表示するよ
  disk free の略なんだ

```bash
df [オプション]... [ファイル]...
```

オプション               | 役割
------------------------ | ----
`-h`, `--human-readable` | 人間に読みやすい形式で表示

しげる（通常）：
  `-h` オプションを指定して実行してみよう！

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
  ストレージごとに総容量、使用容量、空き容量などを出してくれるんだね
  空き領域をパーセントで出してくれるのもわかりやすくて親切だよ
  これでどの領域に空きが無いのか一目でわかるね！

## `du` コマンド

しげる（通常）：
  `du` は各ディレクトリの使用容量を表示するよ
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
  自分のホームディレクトリがどれだけ容量を使っているか確認してみよう！

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
  ファイルやディレクトリごとに使用容量がわかるんだね！
  使用容量合計だけ知りたいなら `-s` オプションが良さそう！

## まとめ

みどり（通常）：
  今回はストレージリソース状況を確認する方法を学んだよ！
  `df` や `du` で状況を調べられるんだね！
しげる（通常）：
  ストレージが不足するとデータ書き込みエラーが発生したり不完全なファイルができてしまうことがあるんだ
  このような状態になったら、不要ファイルを削除して容量を空けよう！

