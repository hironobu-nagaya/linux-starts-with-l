chapter=6
story=15
title=ClamAV
keyword=daemon
keyword=ClamAV
keyword=clamd
keyword=freshclam
keyword=clamdscan
keyword=clamscan
keyword=Eicar
prev=6/14/
prev-title=Samba
next=6/16/
next-title=Apache HTTP Server

# ClamAV

みどり（通常）：
  お兄ちゃん！
  Linux にはアンチウイルスソフトは無いのかな？
しげる（通常）：
  もちろんあるよ！
  今回はオープンソースの
  アンチウイルスソフト
  [ClamAV](https://www.clamav.net) を紹介しよう

## インストール

しげる（通常）：
  ClamAV のパッケージ名は `clamav` だよ
  パッケージ管理システムから
  インストールしよう

```bash
sudo apt install -y clamav
```

みどり（通常）：
  うん！
  もう `apt` でのインストールは
  慣れっこだね！

## 設定

しげる（通常）：
  ClamAV の設定ファイルは
  `/etc/clamd.d/scan.conf` だよ
  まずはオリジナルのバックアップを作成しよう

```bash
sudo cp -v /etc/clamd.d/scan.conf{,.dist}
```

みどり（通常）：
  うん！
  オリジナルの設定を
  バックアップしたよ！
しげる（通常）：
  次はエディタで
  設定ファイルを開こう！

```bash
sudo vim /etc/clamd.d/scan.conf
```

みどり（通常）：
  いつでも編集できるよ！
しげる（通常）：
  設定ファイル中の `Example` を
  コメントアウトすることで
  ClamAV が使えるようになるんだ

```scan.conf
Example
```

みどり（通常）：
  こうかな？

```scan.conf
!start-class-silver!#Example!end!
```

しげる（通常）：
  そう
  それで大丈夫だよ！
  保存して終了しよう！

## 起動

しげる（通常）：
  `freshclam` は
  ウイルス定義ファイルを更新するよ

```bash
freshclam [オプション]...
```

しげる（通常）：
  オプションなしで実行しよう

```bash
sudo freshclam
```

みどり（通常）：
  できたよ！
みどり（通常）：
  でも毎回手動で
  更新するのは面倒だね
しげる（通常）：
  定義ファイル自動更新サービス
  `clamav-freshclam` が用意されているよ
  サービスを起動し自動起動も有効にしよう

```bash
sudo systemctl enable --now clamav-freshclam
```

しげる（通常）：
  起動したら正常に動作しているか確認しよう！

```bash
sudo systemctl status clamav-freshclam
```
みどり（通常）：
  無事動いたよ！
  これで定義ファイルは
  自動更新されるんだね！
しげる（通常）：
  次は ClamAV デーモン `clamd` を起動しよう！
  ディストリビューションによっては
  `@設定ファイル名` を続けて
  `clamd@scan` とする必要があるんだ
  以下のコマンドで `clamd` を起動し
  自動起動を有効にしよう

```bash
sudo systemctl enable --now clamd@scan
```

しげる（通常）：
  これも起動したら
  動作確認をしよう

```bash
sudo systemctl status clamd@scan
```

みどり（通常）：
  こっちも OK だよ！
  これでウイルススキャンの
  準備ができたんだね！

## 実行

みどり（通常）：
  いよいよ実行だね！
  ウイルスってどこで
  手に入れたらいいのかな？
しげる（通常）：
  本物のウイルスを
  手元に置くのは危ないよ！
  別の方法で動作確認をしよう
しげる（通常）：
  ここでは「エイカー(Eicar)」を用意するよ
  これは無害な内容だけど
  ウイルスとして検知されると
  決められているファイルなんだ
  ウイルス検出の動作テストなどで
  使われるよ
みどり（通常）：
  へぇ…
  そんなファイルがあるんだ！
  どうやって用意するのかな？
しげる（通常）：
  ファイルの内容が
  特定の文字列であるだけでいいんだ
  以下のコマンドで
  Eicar ファイル `/tmp/eicar` を
  作成するよ
しげる（通常）：
  ダミーといえども本当に
  ウイルスとして検知されるものだよ
  会社や学校などの場で試すと
  誤解を招く可能性があるんだ
  必ず個人の環境などで実行してね

```bash
echo -n 'P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > /tmp/eicar
```

みどり（通常）：
  これでウイルスの代わりが
  用意できたんだね
しげる（通常）：
  ClamAV のスキャンは
  2種類のコマンドが用意されているんだ

コマンド    | 役割
----------- | ----
`clamscan`  | `clamd` を使わないスキャン
`clamdscan` | `clamd` を使うスキャン、高速で並列スキャン対応

しげる（通常）：
  `clamd` を起動しているので
  `clamdscan` を実行してみよう

```bash
clamdscan /tmp/eicar
```

みどり（通常）：
  うまく見つけてくれるかな？

```console
/tmp/eicar: Win.Test.EICAR_HDB-1 FOUND

----------- SCAN SUMMARY -----------
Infected files: 1
Time: 0.004 sec (0 m 0 s)
Start Date: 2024:12:25 10:00:00
End Date:   2024:12:25 10:00:00
```

みどり（通常）：
  `FOUND` ということは
  検出できているね！
  結果に「感染ファイル: 1(Infected files: 1)」
  と出ているよ！
しげる（通常）：
  上手く行ったようだね！
  確認ができたら
  Eicar は削除しよう！

```bash
rm /tmp/eicar
```

みどり（通常）：
  後片付けも完了だよ！

## まとめ

みどり（通常）：
  今回は Linux で使えるオープンソースの
  アンチウイルスソフト ClamAV を学んだよ！
  これでウイルスも怖くないね！
しげる（通常）：
  インストールしただけで安心せず
  今後の運用も考えよう！
  スキャンを定期的に実行する
  検出されたファイルの扱いを
  決めておくなどを考えておき
  悪意のあるプログラムを
  検出できる体制を作っておこう！

