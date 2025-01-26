chapter=7
story=5
title=ローカライズ
keyword=Raspberry Pi
keyword=localize
prev=7/4/
prev-title=DHCP設定
next=7/6/
next-title=ブートローダ更新

# ローカライズ

みどり（通常）：
  お兄ちゃん！
  これで Raspberry Pi 上で自由に
  Linux を動かせるようになったよ！
  最初は何をしようかなぁ…
しげる（通常）：
  最初は自分の国に合わせた
  設定をするといいよ
  例えば以下はどうだろう？

## apt リポジトリ設定

しげる（通常）：
  ソフトウェアの
  ダウンロード元を
  日本国内に変更すれば
  多くの場合ダウンロード速度が
  速くなるんだ
みどり（通常）：
  それは嬉しい設定だね！
  どうやって設定すれば
  いいのかな？
しげる（通常）：
  パッケージ管理ツール
  `apt` のダウンロード元は
  `/etc/apt/sources.list` で
  設定されているんだ
  このファイルを編集するよ
しげる（通常）：
  最初に設定ファイルを
  バックアップしよう

```bash
sudo mv -v /etc/apt/sources.list{,.dist}
```

みどり（通常）：
  うん！
  バックアップしたよ！
しげる（通常）：
  次に日本国内サーバ用の
  設定ファイルに置き換えよう
  [Debian JP Project](https://www.debian.or.jp) が
  設定ファイルのサンプルを
  公開しているよ
  以下でダウンロードしよう

```bash
sudo curl -L \
    -o /etc/apt/sources.list \
    https://www.debian.or.jp/using/apt/sources.list.http.ftp.jp.debian.org
```

みどり（通常）：
  Raspberry Pi OS のベースが
  Debian だから流用できるんだ！
  そのまま使える設定が
  用意されているなんて親切だね！

## NTP サーバ設定

しげる（通常）：
  Raspberry Pi OS の時刻合わせは
  `systemd-timesyncd` を使っているんだ
みどり（通常）：
  以前教えてもらったやつだね！
  それと同じことをすれば
  日本の NTP サーバに
  時刻合わせをしてくれるんだ！

## まとめ

みどり（通常）：
  今回はサーバへの問い合わせを
  日本国内のサーバを使うよう
  設定したよ！
しげる（通常）：
  国内のサーバを使うことで
  速いダウンロードや
  正確な時刻合わせができるよ！
  小さな工夫の積み重ねが
  自分の Linux を使いやすくしていくよ

