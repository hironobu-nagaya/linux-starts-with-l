chapter=4
story=15
title=fdiskコマンド
keyword=super user
keyword=root
keyword=fdisk
keyword=partition
prev=4/14/
prev-title=パーティション
next=4/16/
next-title=ファイルシステム

# `fdisk` コマンド

みどり（通常）：
  前回はパーティションについて学んだね！
しげる（通常）：
  今回はパーティションを
  実際に操作してみよう！
しげる（通常）：
  ストレージのパーティションを変更すると
  そのパーティション上にあったデータは
  使えなくなってしまうよ
  今回の操作はそのことに注意してね

## 使い方

しげる（通常）：
  `fdisk` は
  パーティションを管理するよ

```bash
fdisk [オプション]... デバイス
```

## 実践

しげる（通常）：
  まずはブロックデバイス一覧を確認しよう！

```bash
lsblk
```

みどり（通常）：
  うん！

```console
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 953.9G  0 disk
├─sda1   8:1    0   512M  0 part /boot
└─sda2   8:2    0 953.4G  0 part /
```

しげる（通常）：
  `/dev/sda` がシステムのストレージで
  `/dev/sda1` と `/dev/sda2` が
  そのパーティションだよ
しげる（通常）：
  未フォーマットの USB メモリを用意したよ！
  この USB メモリを Linux マシンに差してから
  もう一度 `lsblk` を実行してみよう！
みどり（通常）：
  やってみるね！

```console
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 953.9G  0 disk
├─sda1   8:1    0   512M  0 part /boot
└─sda2   8:2    0 953.4G  0 part /
sdb      8:16   0  28.9G  0 disk
```

みどり（通常）：
  `sdb` が追加されたね！
しげる（通常）：
  `/dev/sdb` が USB メモリを指すデバイスだよ
  `sdb` の下に階層が無いので
  パーティションがまだ無いことがわかるね
  最初にここへパーティションを作成しよう！
みどり（通常）：
  せっかくだから
  Linux だけでなく
  Windows や macOS でも
  使えるようにしたいなぁ
しげる（通常）：
  それなら形式は MBR で
  1つだけのパーティションを
  作成しよう！
しげる（通常）：
  この場合 `fdisk` は
  以下のように実行するよ

```bash
sudo fdisk /dev/sdb
```

みどり（通常）：
  ここから
  パーティションを
  操作するんだね！

```console

Welcome to fdisk (util-linux 2.37.4).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): !cursor!
```

みどり（通常）：
  入力を求められているね
  `fdisk` は対話的な
  コマンドなんだ！
しげる（通常）：
  対話的な操作では
  以下のようなコマンドを
  入力して操作するよ

コマンド | 役割
-------- | ----
`m`      | ヘルプを表示
`p`      | 現在のパーティション構成を表示
`l`      | パーティション種別を表示
`o`      | MBR パーティションテーブル新規作成
`g`      | GPT パーティションテーブル新規作成
`n`      | パーティション作成
`d`      | パーティション削除
`w`      | 現在のパーティション構成を書き込む
`q`      | 現在のパーティション構成を破棄して終了

しげる（通常）：
  MBR でパーティションを作成するので
  まずは `o` を指定しよう！

```fdisk
Command (m for help): o
Created a new DOS (MBR) disklabel with disk identifier 0xf9885ead.
```

みどり（通常）：
  これでこの USB メモリの
  パーティションは
  MBR で作られるんだね！
しげる（通常）：
  次に `n` で
  新しいパーティションを
  作成しよう！

```fdisk
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): !cursor!
```

みどり（通常）：
  「パーティションの種類は？」
  って聞かれたよ
しげる（通常）：
  MBR で作れる
  基本的な4つの
  パーティションが
  `primary` だよ
しげる（通常）：
  `extended` で5番目以降の
  パーティションを作る
  仕組みがあるんだけど
  今回はパーティションを
  1つしか作らないので
  `primary` を選ぼう
しげる（通常）：
  `default p` となっているので
  Enter だけ押せば
  `primary` となるよ
みどり（通常）：
  じゃあデフォルト設定で進めるね！

```fdisk
Using default response p.
```

```fdisk
Partition number (1-4, default 1): !cursor!
```

みどり（通常）：
  今度は
  「パーティション番号は？」
  と聞かれたね
しげる（通常）：
  通常パーティション番号は
  先頭から順番に使うよ
  なのでここでは
  `1` を指定しよう
  `default 1` とあるので
  Enter だけ押せば
  `1` になるよ
みどり（通常）：
  うん！

```fdisk
First sector (2048-60620799, default 2048): !cursor!
```

みどり（通常）：
  「最初のセクターは？」
  と聞かれたよ？
しげる（通常）：
  セクターは
  「利用可能なストレージ領域」
  だと思ってもらえれば大丈夫だよ
  `2048` から `60620799` まで
  選択可能と言われていて
  今回作成するパーティションは
  どこから使い始めるのかを
  指定するんだ
みどり（通常）：
  `default 2048` と
  一番最初の領域が
  デフォルトになっているね
  じゃあこれもデフォルトを指定する
  Enter で進めるよ！

```fdisk
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-60620799, default 60620799): !cursor!
```

みどり（通常）：
  「最後のセクターは？」かぁ…
  「最初」と「最後」を指定して
  その範囲をパーティションにするんだね！
しげる（通常）：
  そのとおり！
  デフォルトは
  一番最後の `60620799` が
  指定されているので
  このまま Enter を押そう！

```fdisk
Created a new partition 1 of type 'Linux' and of size 28.9 GiB.
```

みどり（驚き）：
  おー！
  デフォルトの指定だけで
  パーティションが作れちゃったよ！
みどり（通常）：
  でも `type 'Linux'` と
  Linux で使われるみたいな
  表示があるけど…
しげる（通常）：
  パーティションには
  その利用目的も
  一緒に記録されているんだ
  `t` でその種別を変更しよう！

```fdisk
Command (m for help): t
Selected partition 1
Hex code or alias (type L to list all): !cursor!
```

みどり（通常）：
  ここで種別を
  指定するんだね
しげる（通常）：
  ここでは `FAT32` という
  フォーマットを指定するよ
  `0c` を入力しよう！
みどり（通常）：
  うん！

```fdisk
Hex code or alias (type L to list all): 0c
Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.
```

しげる（通常）：
  種別を指定する番号は
  `l` コマンドで確認できるよ
みどり（通常）：
  ふぅ…
  パーティションも作ったし
  その種別もちゃんと指定できたね！
しげる（通常）：
  最後にこのパーティションテーブルを
  USB メモリに書き込んで終わりだよ
  `w` コマンドを実行しよう！


```fdisk
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

みどり（通常）：
  `fdisk` が終了して
  元のシェル操作に戻ったよ
しげる（通常）：
  この状態で `lsblk` を
  実行してみよう！
  作成したパーティションが
  表示に現れるはずだよ

```bash
lsblk
```

みどり（通常）：
  うん！
  確認は大事だね！

```console
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 953.9G  0 disk
├─sda1   8:1    0   512M  0 part /boot
└─sda2   8:2    0 953.4G  0 part /
sdb      8:16   0  28.9G  0 disk
└─sdb1   8:17   0  28.9G  0 part
```

みどり（通常）：
  USB メモリを表す `sdb` の下に
  `sdb1` が追加されたよ！
  これが今回作成した
  パーティションなんだね！

## まとめ

みどり（通常）：
  今回は `fdisk` で
  パーティションを作成したよ！
  ちょっと操作が多くて
  大変だったね！
しげる（通常）：
  パーティション作成は
  頻繁に行う操作ではないからね
  必要になったら調べながら
  操作するぐらいで大丈夫だよ！
しげる（通常）：
  `fdisk` は古くからある
  パーティション操作ツールなんだ
  たいていのシステムで
  使えるという利点があるけど
  より便利に改良された
  パーティション操作ツールも存在するよ

* `gdisk`
* `parted`

