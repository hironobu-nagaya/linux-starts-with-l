chapter=6
story=16
title=Apache HTTP Server
keyword=daemon
keyword=Apache HTTP Server
keyword=apache2
keyword=httpd
prev=6/15/
prev-title=ClamAV
next=6/17/
next-title=Postfix

# Apache HTTP Server

みどり（通常）：
  お兄ちゃん！
  ブラウザで見るページって
  サーバで公開されているんだよね？
  同じようにページを公開できるのかな？
しげる（通常）：
  もちろん！
  そのようなサーバを
  HTTP サーバと呼ぶよ
  今回は代表的な HTTP サーバ
  [Apache HTTP Server](https://httpd.apache.org) を扱おう！

## インストール

しげる（通常）：
  パッケージ名は
  ディストリビューションによって異なり
  `apache2` や `httpd` となっているよ
  パッケージ管理システムから
  検索してインストールしよう

```bash
sudo apt install -y apache2
```

みどり（通常）：
  うん！
  終わったよ！

## 設定

しげる（通常）：
  次は設定ファイルを確認しよう
  `apache2.conf` や
  `httpd.conf` などに
  なっているんだ
しげる（通常）：
  設定ファイルの
  場所が分からなければ
  `find` で検索してみよう

```bash
sudo find /etc -name apache2.conf -o -name httpd.conf
```

みどり（通常）：
  うん！
  試してみるね！

```console
/etc/apache2/apache2.conf
```

みどり（通常）：
  私の場合は
  `/etc/apache2/apache2.conf` みたいだね！
しげる（通常）：
  今回は設定を変更しないけど
  設定を書き換えた場合は
  間違った記述がないか
  設定ファイルの書式チェックを行おう
  以下のようにすると確認できるよ！

```bash
apachectl configtest
```

しげる（通常）：
  次に設定ファイルの中から
  `DocumentRoot` という記述を探そう
  その場所に HTTP サーバが公開する
  ファイルが配置されているんだ

```bash
grep 'DocumentRoot' /etc/apache2/apache2.conf
```

みどり（通常）：
  実行して
  確認するよ！

```console
DocumentRoot "/var/www/html"
```

みどり（通常）：
  設定されている値は
  `/var/www/html` と
  なっているみたい
しげる（通常）：
  そこのディレクトリで
  HTML ファイルを公開しているね
  `/var/www/html` 直下に
  HTML ファイルを作ろう

```bash
sudo bash -c 'cat > /var/www/html/sample.html << \EOF
<!DOCTYPE html>
<html>
  <head>
    <title>私のページ</title>
  </head>
  <body>
    <h1>自分のウェブページへようこそ！</h1>
  </body>
</html>
EOF'
```

みどり（通常）：
  うん！
  HTML ファイルを
  配置したよ！

## 起動

しげる（通常）：
  いよいよ起動だよ！
  デーモンを動かし
  自動起動を有効にしよう！

```bash
sudo systemctl enable --now apache2
```

しげる（通常）：
  問題なく起動したかどうかは
  以下で確認しよう！

```bash
systemctl status apache2
```

みどり（通常）：
  エラーなく起動したみたい！
  さっそく確認してみようよ！
しげる（通常）：
  作成した `sample.html` は
  以下の URL からアクセスできるよ
  ブラウザから見てみよう！

```plaintext
http://サーバのIPアドレス/sample.html
```

みどり（通常）：
  IP アドレスを調べるには
  `ip addr show` だよね！
  結果は `192.168.0.100` だったよ！
みどり（通常）：
  ということはブラウザから
  以下の URL に
  アクセスすればいいんだ！

```plaintext
http://192.168.0.100/sample.html
```

みどり（驚き）：
  …おお！
  自分が作ったページが
  表示されている！
しげる（通常）：
  アクセスできない場合は
  ファイアウォールで
  防がれている可能性があるよ
  ディストリビューションによって異なり
  設定も難しい場合が多いので
  ここでの説明は省略するね

## まとめ

みどり（通常）：
  今回は Apache HTTP Server を扱ったよ！
  HTML ファイルを公開して
  ブラウザから見れるようになるんだ！
しげる（通常）：
  今回は基礎的な使い方のみ扱ったけど
  学ぶべきことはたくさんあるんだ
  例えば、暗号化された安全な HTTPS 接続や
  プログラムに HTML を生成させる
  動的ページなどがあるよ
  この分野に興味があるのなら
  書籍などの教材を用意して取り組んでみよう！

