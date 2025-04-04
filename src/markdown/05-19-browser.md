chapter=5
story=19
title=テキストブラウザ
keyword=text browser
keyword=lynx
keyword=links
keyword=w3m
prev=5/18/
prev-title=動画再生
next=5/20/
next-title=メッセージ(準備)

# テキストブラウザ

みどり（通常）：
  お兄ちゃん！
  「えっ、これも端末で動くの？」
  っていうものが他に無いかな？
しげる（通常）：
  それなら「テキストブラウザ(text browser)」なんてどうだろう？
  端末画面でブラウジングができるんだ

## 種類

しげる（通常）：
  テキストブラウザはWebページを
  テキストだけで閲覧できるブラウザだよ
  代表的なものを紹介するね

テキストブラウザ | 特徴
---------------- | ----
`lynx`           | 古くから存在しユーザも多い
`links`          | 動作が軽い
`w3m`            | 日本発で日本語環境に親和性がある

みどり（通常）：
  へぇ…
  こんなに種類があるんだね！
しげる（通常）：
  試したいものを選んだら
  パッケージ管理システムからインストールしよう
みどり（通常）：
  今回は `lynx` をインストールしてみるよ！

```bash
apt install -y lynx
```

## ブラウジング

しげる（通常）：
  では実際に `lynx` でブラウジングをしてみよう
  以下のコマンドで指定した URL を開けるよ

```bash
lynx https://google.co.jp/
```

みどり（驚き）：
  おお！
  テキストだけだけど Google のページだってわかる！
しげる（通常）：
  画像やデザインは表示できないけど
  基本的な情報を確認するには十分なんだ

## まとめ

みどり（通常）：
  今回はテキストブラウザを教えてもらったよ
  端末環境でウェブサイトが
  見られるなんて思ってもいなかったよ
しげる（通常）：
  最近のページは画像や複雑な構造を使っていることが多く
  テキストブラウザでは見づらい場合も多いんだ
  普段は通常のブラウザを使い次のような場面で活用すると良いよ

* GUI 環境が使えないとき
* ネットワークが遅く軽量なアクセスが必要なとき

みどり（通常）：
  なるほど！
  いざという時のための奥の手として知っておくと便利だね！

