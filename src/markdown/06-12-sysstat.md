chapter=6
story=12
title=sysstat
keyword=resource
keyword=sysstat
prev=6/11/
prev-title=systemd-timesyncd
next=6/13/
next-title=smartmontools

# `sysstat`

みどり（通常）：
  お兄ちゃん！
  リソース状況を見るには
  コマンドを打たないと
  いけないのかな？
  真夜中の状況や
  1日の変動などを
  見るには不便だよ！
しげる（通常）：
  リソース監視ツールと
  いうものがあるよ！
  今回は古くから使われている
  リソース監視ツール
  `sysstat` を使おう

## インストール

しげる（通常）：
  まずは
  `sysstat` パッケージを
  インストールしよう

```bash
sudo apt install -y sysstat
```

みどり（通常）：
  パッケージ管理システムのおかげですごい楽だよ！

## 設定

しげる（通常）：
  設定ファイルは `/etc` 配下に
  `sysstat` という名前で置かれているよ
  ディストリビューションによってパスが異なるので
  見つからなかったら `find` を使おう！

```bash
sudo find /etc -name sysstat
```

みどり（通常）：
  うん！

```console
/etc/default/sysstat
```

みどり（通常）：
  このファイルが設定ファイルなんだね！
しげる（通常）：
  一部のディストリビューションでは
  `ENABLED` という項目が `false` になっているんだ
  この場合 `sysstat` を動作させてあげるには
  値を `true` に変更してあげる必要があるよ
みどり（通常）：
  お兄ちゃんのいうとおりだったよ
  `ENABLED` という項目があったよ

```plaintext
ENABLED="false"
```

みどり（通常）：
  これをこう書き換えれば
  いいんだよね？

```plaintext
ENABLED="true"
```

しげる（通常）：
  うん
  それでいいよ！

## 起動

しげる（通常）：
  それでは `sysstat` を動かし
  自動起動を有効にしよう

```bash
sudo systemctl enable --now sysstat
```

しげる（通常）：
  正常に動作しているかどうかは
  以下で確認できるよ

```bash
systemctl status sysstat
```

みどり（通常）：
  正しく動作しているはずなんだけど…
  それらしいプロセスが見当たらないよ？
しげる（通常）：
  `sysstat` は `cron` ベースの仕組みで動いているんだ
  なので常に `sysstat` のプロセスが動いていないんだよ
  `sysstat` では以下のプログラムが `cron` で動いているよ

プログラム | 動作タイミング | 役割
---------- | -------------- | ----
`sa1`      | 10分おき       | リソース状況収集
`sa2`      | 1日の最後      | リソース統計出力

## 確認

しげる（通常）：
  `sar` は
  `sysstat` が収集した
  情報を表示するよ

```bash
sar [オプション]... [日付 [表示間隔]]
```

オプション | 説明
---------- | ----
-u         | CPU 状況を表示(デフォルト)
-r         | メモリ状況を表示
-b         | ストレージ I/O 状況を表示
-n DEV     | ネットワーク状況を表示
--human    | 人間に読みやすい形式で表示

しげる（通常）：
  日付は `-1` を指定すると
  「1日前」のリソース状況を表示するよ
  指定が無ければ本日を表示するんだ
しげる（通常）：
  ここではオプションなしで
  実行してみよう！

```bash
sar
```

みどり（通常）：
  うん！

```console
Linux 6.6.51+rpt-rpi-2712 (carter)      13/01/25        _aarch64_       (4 CPU)

00:00:01        CPU     %user     %nice   %system   %iowait    %steal     %idle
00:10:01        all      0.01     59.55      0.02      0.01      0.00     40.42
00:20:04        all      0.01     59.90      0.01      0.10      0.00     39.98
00:30:00        all      0.00     60.11      0.01      0.00      0.00     39.87
00:40:00        all      0.01     59.94      0.01      0.00      0.00     40.04
...
```

みどり（驚き）：
  おお！
  本日10分おきの
  CPU リソース状況が表示されたよ！
しげる（通常）：
  デフォルトは CPU に関する情報だけど
  オプションを指定すると
  他のリソース状況も確認できるんだ

## まとめ

みどり（通常）：
  今回はリソース監視ツール
  `sysstat` を学んだよ！
  定期的にシステム負荷情報を収集して
  後から確認ができるんだ！
しげる（通常）：
  今回は基本的な使い方の紹介だけだよ
  `sar` をスクリプトに組み込んだり
  データをグラフ化するツールと
  組み合わせることもできるよ
  リソース不足をいち早く知れるよう
  リソース監視体制を
  整えておくのがおすすめだよ

