chapter=6
story=13
title=smartmontools
keyword=daemon
keyword=S.M.A.R.T
keyword=smartmontools
keyword=smartctl
prev=6/12/
prev-title=sysstat
next=6/14/
next-title=Samba

# smartmontools

みどり（通常）：
  お兄ちゃん！
  この前 HDD が故障したんだ！
  バックアップは取っていたけど
  突然の故障って怖いよね…
しげる（通常）：
  SSD や HDD は
  自己診断機能を持っているんだ
  これで故障の予兆を
  知れる場合があるよ
みどり（通常）：
  へぇ！
  サーバの安全稼働のためにも
  ぜひ知りたいよ！
しげる（通常）：
  その機能を「S.M.A.R.T
  (Self-Monitoring, Analysis and Reporting Technology)」
  と呼ぶんだ
  ディスクの健康状態の指標を自動収集し
  故障の予兆があれば知らせてくれるよ
しげる（通常）：
  今回は S.M.A.R.T を扱う
  [smartmontools](https://www.smartmontools.org) を学ぼう！

## インストール

しげる（通常）：
  まずは `smartmontools` を
  インストールしよう！

```bash
sudo apt install -y smartmontools
```

みどり（通常）：
  パッケージ名さえわかれば
  簡単にインストールできて楽だね！

## 設定

しげる（通常）：
  設定は `/etc/smartmontools` 配下にあるよ
  でも基本的な使い方では
  変更することが無いから
  気にしなくても大丈夫
  設定ファイルがあるということだけ
  覚えておこう
みどり（通常）：
  デフォルトでよしなに
  動いてくれる設定に
  なっているんだね！

## 起動

しげる（通常）：
  では `smartmontools` を動かし
  自動起動を設定しよう

```bash
sudo systemctl enable --now smartmontools
```

しげる（通常）：
  起動したらちゃんと
  動作しているか確認しよう

```bash
sudo systemctl status smartmontools
```

みどり（通常）：
  うん！
  ちゃんと動いたよ！

## 確認

しげる（通常）：
  `smartmontools` では
  `smartd` デーモンが
  S.M.A.R.T 情報を監視しているよ
しげる（通常）：
  `smartctl` は `smartd` 管理ツールだよ
  `smartctl` 経由で S.M.A.R.T 情報を扱えるよ

```bash
smartctl [オプション]... デバイス
```

みどり（通常）：
  `systemctl` と `systemd` の
  関係に似ているね！
しげる（通常）：
  まずは S.M.A.R.T 機能を持っている
  ストレージ一覧を確認しよう！

```bash
smartctl --scan
```

みどり（通常）：
  たいていの SSD や HDD には
  S.M.A.R.T があるんだよね？
  最低一つは見つかると思うんだけど…

```console
/dev/sda -d scsi # /dev/sda, SCSI device
```

みどり（通常）：
  `/dev/sda` が S.M.A.R.T に
  対応しているんだね！
しげる（通常）：
  今回は簡易診断機能を使ってみよう！
  `/dev/sda` を確認するなら
  以下のように実行するよ

```bash
sudo smartctl --health /dev/sda
```

みどり（通常）：
  ストレージの健康診断みたいなものだね
  単発ではなく定期的に実行したいね

```console
=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED
```

みどり（通常）：
  結果は `PASSED` だったよ！
  簡易診断だけど
  「問題なし」と出ると
  ちょっと安心だね
しげる（通常）：
  もし結果が
  `FAILED` だったら
  そのストレージに
  問題がある可能性が高いんだ
  すみやかにバックアップを取り
  ストレージの入れ替えを
  おすすめするよ
みどり（通常）：
  `FAILED` の
  原因を調べるには
  どうすればいいのかな？
しげる（通常）：
  以下で
  S.M.A.R.T が集めた
  情報を確認できるよ！

```bash
sudo systemctl -a /dev/sda
```

## まとめ

みどり（通常）：
  今回は `smartmontools` の
  使い方を学んだよ！
  S.M.A.R.T を `smartd` が監視して
  `smartctl` 経由で管理するんだ！
しげる（通常）：
  今回は簡易診断だけの紹介だよ
  他にも時間が掛かるが
  詳細な診断ができたり
  故障の兆候を発見したら
  メールを送るなどもできるんだ！

