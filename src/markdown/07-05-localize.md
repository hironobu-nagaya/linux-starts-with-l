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
  これで Raspberry Pi を自由に操作できるようになったよ！
  最初は何をしようかなぁ…
しげる（通常）：
  最初は自分の国に合わせた設定をすると良いよ
  例えば以下のようなものはどうだろう？

## apt リポジトリ設定

しげる（通常）：
  ソフトウェアのダウンロード元を日本国内に変更すれば
  多くの場合ダウンロード速度が速くなるんだ
みどり（通常）：
  どうやって設定すればいいのかな？
しげる（通常）：
  パッケージ管理ツール `apt` のダウンロード元は
  `/etc/apt/sources.list` で設定されているんだ
  このファイルを編集するよ
しげる（通常）：
  最初に設定ファイルをバックアップしよう

```bash
sudo mv -v /etc/apt/sources.list{,.dist}
```

みどり（通常）：
  うん！
  バックアップしたよ！
しげる（通常）：
  次に日本国内サーバ用の設定ファイルに置き換えよう
  [Debian JP Project](https://www.debian.or.jp) が設定ファイルのサンプルを提供しているよ
  以下でダウンロードしよう

```bash
sudo curl -L \
  -o /etc/apt/sources.list \
  https://www.debian.or.jp/using/apt/sources.list.http.ftp.jp.debian.org
```

みどり（通常）：
  Raspberry Pi OS のベースが Debian だから流用できるんだ！
  そのまま使える設定が用意されているなんて親切だね！

## NTP サーバ設定

しげる（通常）：
  Raspberry Pi OS の時刻合わせは `systemd-timesyncd` を使っているんだ
みどり（通常）：
  以前教えてもらったやつだね！
  それと同じことをすれば日本の NTP サーバに時刻合わせをしてくれるんだ！

## まとめ

みどり（通常）：
  今回はサーバへの問い合わせを日本国内のサーバを使うよう設定したよ！
しげる（通常）：
  国内のサーバを使うことでより速いダウンロードやより正確な時刻合わせができるよ！
  小さな工夫の積み重ねが自分の Linux を使いやすくしていくよ

