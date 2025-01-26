chapter=7
story=3
title=Raspberry Pi OS
keyword=Raspberry Pi
keyword=Raspberry Pi OS
keyword=Raspberry Pi Imager
prev=7/2/
prev-title=Raspberry Pi に必要な部品
next=7/4/
next-title=DHCP設定

# Raspberry Pi OS

みどり（通常）：
  前回は Raspberry Pi を動かすのに
  必要な部品を紹介してもらったよ！
しげる（通常）：
  今回は Raspberry Pi へ OS を
  インストールして動かしてみよう！

## ディストリビューション選択

みどり（通常）：
  ディストリビューションは
  どれを選べばいいのかな？
しげる（通常）：
  最初は公式の
  Raspberry Pi OS が
  おすすめだよ！

* 公式サポートが充実している
* Debian ベースで使いやすい
* 情報が多い

## Raspberry Pi Imager

しげる（通常）：
  公式で OS 書き込みツール
  [Raspberry Pi Imager](https://www.raspberrypi.com/software/) を公開しているよ
  リンク先からダウンロードして
  インストールしてね
みどり（通常）：
  うん！
  起動までちょっと待ってね！

[Raspberry Pi Imager](img/raspberry-pi-imager.png)

みどり（通常）：
  インストールして起動したら
  色々な選択がでてきたよ？
しげる（通常）：
  最初は「デバイスを選択」
  これは自分の Raspberry Pi モデルを指定してね
  続く「OSを選択」で選択できる OS が
  指定されたモデルで動くものに絞られるんだ
みどり（通常）：
  次は「OSを選択」
  Raspberry Pi OS にも
  種類があるんだね？
しげる（通常）：
  まずは「Raspberry Pi OS (other)」を選ぼう
  ここにいくつかの候補があるんだ
  用途に応じて以下から選んでね

用途             | OS の選択
---------------- | ---------
GUI 環境が必要   | Raspberry Pi OS Full (64-bit)
CUI 環境だけ良い | Raspberry Pi OS Lite (64-bit)

みどり（通常）：
  勉強目的で使おうと思うので
  「Raspberry Pi OS Lite (64-bit)」
  を選択するね！
しげる（通常）：
  最後に「ストレージを選択」だよ
  microSD カードリーダを接続し
  それをを選ぼう
  ここに OS が書き込まれるんだ

## OS のカスタマイズ

みどり（通常）：
  書き込もうとしたら
  「OSをカスタマイズしますか？」
  って聞かれたよ
  これはどうすればいいのかな？
しげる（通常）：
  「設定を編集する」を押して
  以下の初期設定を行おう

設定項目             | 用途
-------------------- | ----
ユーザ名とパスワード | ログイン
ロケール             | 時差を含めた時刻設定

しげる（通常）：
  また必要に応じて
  以下も設定しよう！

設定項目   | 用途
---------- | ----
Wi-Fi      | 無線ネットワーク
SSH 有効化 | リモート接続

## 起動

みどり（通常）：
  書き込みが終わったよ！
  早く動かそう？
しげる（通常）：
  Raspberry Pi 基板裏側に
  microSD スロットがあるよ
  OS を書き込んだ
  microSD カードを
  差し込もう！
みどり（通常）：
  うん！
しげる（通常）：
  次は電源ケーブルを接続しよう
  Raspberry Pi 4B 以前は
  これで電源が入るよ
  Raspberry Pi 5 は
  「電源ボタン」を
  押す必要があるよ
みどり（通常）：
  Raspberry Pi 4B 以前は
  ケーブルの抜き差しで
  電源を操作するんだ
  ちょっと荒っぽいね
しげる（通常）：
  頻繁に抜き差しすると
  端子が甘くなるよ
  気になるのなら
  電源スイッチ付きの
  USB ケーブルを使うといいよ
みどり（通常）：
  Raspberry Pi の画面に
  出力が出てきたね！
  起動メッセージが表示されて…
  …再起動した？
しげる（通常）：
  初回起動時には
  数回再起動することがあるよ
  メッセージが止まるまで待とう
みどり（驚き）：
  おっ！
  「login:」が
  表示されたよ！
みどり（笑顔）：
  さっき設定した
  ユーザ名とパスワードを
  入力すればいいんだね
しげる（笑顔）：
  そう！
  これで Raspberry Pi で
  Linux が使えるようになったよ

## まとめ

みどり（通常）：
  今回は microSD カードに
  Raspberry Pi OS を書き込んで
  Raspberry Pi を動かしたよ！
  これから何しようかな？！
しげる（通常）：
  おめでとう！
  何をするかは
  みどりの自由だよ！

