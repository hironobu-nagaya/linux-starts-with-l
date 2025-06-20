chapter=4
story=19
title=hostsファイル
prev=4/18/
prev-title=グループ設定ファイル
next=4/20/
next-title=fstabファイル

# `hosts` ファイル

しげる（通常）：
  今回は `/etc/hosts` を説明するよ！
みどり（通常）：
  それはどういう設定をするのかな？
しげる（通常）：
  このファイルは
  IPアドレスと名前の
  対応が書かれているよ

## 書式

しげる（通常）：
  `/etc/hosts` の各行は
  以下のような書式で
  対応が書かれているよ

```hosts
IPアドレス ホスト名やドメイン...
```

しげる（通常）：
  ここで設定を行うと
  IP アドレスの代わりに
  ホスト名やドメインを
  使うことができるんだ
みどり（通常）：
  番号じゃなくて名前で
  扱えるようになるんだね
  それはわかりやすいかも！
しげる（通常）：
  また「DNS(domain name system)」という
  ドメインを IP アドレスに変換する
  仕組みより優先されるんだ
  特定のドメインの IP アドレスを
  上書きして使う目的でも使われるよ

## 実践

しげる（通常）：
  では `/etc/hosts` の
  中身を見てみよう！

```bash
cat /etc/hosts
```

みどり（通常）：
  うん！

```hosts
127.0.0.1     localhost
192.168.0.100 carter
```

しげる（通常）：
  `127.0.0.1` は
  自身を表す特別な IP アドレスだよ
  伝統的に `localhost` と
  名前が付いているんだ
  たいていの `/etc/hosts` には
  この行が書かれているはずだよ
みどり（通常）：
  自分自身にアクセスするときには
  `localhost` を使えばいいのね！
しげる（通常）：
  2行目でホスト名と IP アドレスの
  対応が書かれているよ
  これでホスト名を指定することで
  簡単に自ホストへアクセスできるんだ
みどり（通常）：
  ホスト名ってこういうふうに使うんだ！
しげる（通常）：
  `/etc/hosts` には基本的には
  この2行が書かれているよ
  もちろん自分で追加も可能だよ

## まとめ

みどり（通常）：
  今回は `/etc/hosts` 設定ファイルを扱ったよ
  ホスト名やドメインと IP アドレスの
  対応が書かれているんだ！
しげる（通常）：
  複数のマシンを起動しているなら
  他のホスト名の記述を
  書いてあげるといいよ！

