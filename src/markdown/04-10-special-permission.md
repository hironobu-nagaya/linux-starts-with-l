chapter=4
story=10
title=特殊なパーミッション
keyword=super user
keyword=root
keyword=sticky bit
keyword=SETGID
keyword=SETUID
prev=4/9/
prev-title=所有権変更
next=4/11/
next-title=特殊なパーミッション操作

# 特殊なパーミッション

しげる（通常）：
  今回は特殊なパーミッションを話そう！
  一般ユーザでも設定できるけど
  主にスーパユーザが使うものだよ
みどり（驚き）：
  えっ？
  そんなものがあるの？

## sticky bit

しげる（通常）：
  最初は
  「スティッキービット(sticky bit)」だよ
  このパーミッションが設定されている
  ディレクトリの下では
  ファイルの所有者しか
  削除や移動ができないんだ
みどり（通常）：
  たくさんのユーザが
  使う場所で使いそうだね
しげる（通常）：
  そのとおり！
  これは `/tmp` や `/var/tmp` に
  設定されているよ

## SETGID

しげる（通常）：
  次は
  「SETGID(set group id)」だよ
  このパーミッションが
  設定されている実行ファイルは
  どのグループで実行しても
  ファイルの所有グループで
  実行した扱いになるんだ
みどり（通常）：
  うーん？
しげる（通常）：
  SETGID はあまり使われていないよ
  実際は次の SETUID が大事なんだ

## SETUID

しげる（通常）：
  最後に
  「SETUID(set user id)」だよ
  このパーミッションが
  設定されている実行ファイルは
  どのユーザで実行しても
  ファイルの所有ユーザが
  実行した扱いになるんだ
みどり（通常）：
  SETUID は大事と
  言っていたよね？
しげる（通常）：
  SETUID が設定されている
  代表は `passwd` だよ
  ユーザパスワードが保管されている
  設定ファイルは `/etc/shadow` だけど
  スーパユーザしか閲覧できないんだ
みどり（通常）：
  それだとスーパユーザ以外
  パスワード変更できないよ！
しげる（通常）：
  そこで `passwd` の所有ユーザは
  `root` になっていて
  SETUID が設定されているんだ
みどり（通常）：
  なるほど！
  誰が `passwd` を実行しても
  `root` ユーザが実行したことになるので
  パスワード管理ファイル `/etc/shadow` に
  アクセスできるということなんだね！

## まとめ

みどり（通常）：
  今回は特殊なパーミッション
  sticky bit, SETGID, SETUID を学んだよ！
  ごく一部の特殊な用途のためにあるんだ！
しげる（通常）：
  これらを設定することもできるよ
  次回はその設定方法を説明するね！

