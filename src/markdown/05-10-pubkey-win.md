chapter=5
story=10
title=SSH公開鍵認証(Windows)
keyword=SSH
keyword=public key authorization
keyword=Windows
keyword=PuTTY
prev=5/9/
prev-title=SSH接続先設定
next=5/11/
next-title=SSH公開鍵認証(macOS,Linux)

# SSH公開鍵認証(Windows)

みどり（通常）：
  前回までで
  PuTTY 付属の
  PuTTYgen から
  SSH 鍵を生成したよ！
  そして接続先に
  公開鍵の登録まで
  行ったんだ！
しげる（通常）：
  今回はその鍵を使って
  SSH 公開鍵認証をしよう！

## PuTTY

しげる（通常）：
  最初に PuTTY を
  起動しよう！
みどり（通常）：
  うん！

[PuTTY(起動直後)](img/putty.png)

## 設定

しげる（通常）：
  まずは設定をしよう
  左側に Category: があって
  その下にツリーが
  展開されているよね？
みどり（通常）：
  うん！
しげる（通常）：
  一番上の「Session」が
  現在表示されている画面になるんだ
  設定が終わったら「Session」を選択して
  ここに戻ってくるよ
みどり（通常）：
  わかった！
しげる（通常）：
  では以下に
  設定する内容を
  挙げるね

設定場所                              | 設定項目                             | 設定内容
------------------------------------- | ------------------------------------ | --------
Connection > Data                     | Auto-login username                  | ログインするユーザ名
Connection > SSH > Auth > Credentials | Private key file for authentication: | 使用する秘密鍵ファイル

しげる（通常）：
  他にもたくさんの
  設定ができるんだ
  必須ではないけど
  以下も設定するといいよ

設定場所            | 設定項目                                   | 設定内容                  | 説明
------------------- | ------------------------------------------ | ------------------------- | ----
Window > Appearance | Cursor blinks                              | チェックあり              | カーソルが点滅
Window > Appearance | Font:                                      | フォント                  | コンソール用フォント(Consolas, Terminal など)がおすすめ
Window > Behaviour  | Full screen on Alt-Enter                   | チェックあり              | Alt + Enter でフルスクリーン表示
Window > Selection  | Action of mouse buttons:                   | お好み                    | マウスでのコピーと貼り付け操作
Window > Colours    | Cursor Colour                              | Red, Green, Blue を `255` | カーソルの色を白色に変更
Connection          | Seconds between keepalives (0 to turn off) | 1以上の整数(`55`など)     | 指定された間隔(秒)ごとに接続が生きているか確認

みどり（笑顔）：
  設定完了だよ！

## 保存

しげる（通常）：
  それでは
  Category: の「Session」を
  選択して最初の画面に戻ろう！
みどり（通常）：
  うん！

[PuTTY(起動直後)](img/putty.png)

しげる（通常）：
  ここで接続先を
  指定するよ

1. 「Host Name (or IP address)」入力欄に接続先を入力
2. 「Port」入力欄の内容が「22」であることを確認
3. 「Connection type:」ラジオボタンが「SSH」であることを確認

みどり（通常）：
  うん！
  これも大丈夫！
しげる（通常）：
  そうしたら
  これまでの設定に
  名前を付けて保存しよう
  「Saved Sessions」入力欄に
  好きな設定名を入れて
  「Save」ボタンを押そう！
みどり（通常）：
  保存したよ！
  一覧に保存した設定名が
  追加されたね！
しげる（通常）：
  その設定名をダブルクリックしたり
  下部の「Open」ボタンを押せば
  接続が開始されるよ

## 接続

みどり（通常）：
  いよいよ接続だね！
  つなぐよ！

[PuTTY(Security Alert)](img/putty-security-alert.png)

みどり（驚き）：
  わっ！
  重要そうな警告が
  出てきたよ！
しげる（通常）：
  `ssh` のときにも出てきた
  初回接続の警告だよ
  問題ないなら
  「Accept」を押そう
みどり（通常）：
  お兄ちゃんありがとう！
  問題ないので
  「Accept」で進むよ！
みどり（通常）：
  プロンプトが表示された！
  ここからリモート操作が
  できるんだね！
しげる（通常）：
  もし鍵にパスフレーズを設定していた場合
  ここでパスフレーズの入力が求められるよ

## まとめ

みどり（通常）：
  今回は PuTTY で
  公開鍵認証を使った
  SSH 接続を行ったよ！
  パスフレーズを設定していないと
  接続から操作ができるまで
  そのまま通っちゃうんだね！
しげる（通常）：
  現時点で公開鍵認証は
  鍵がちゃんと管理されている限りは
  まず突破は不可能な認証なんだ
  安全にリモート接続するためにも
  公開鍵認証をつかうことを
  おすすめするよ！

