chapter=4
story=5
title=電源管理
keyword=super user
keyword=root
keyword=shutdown
keyword=systemctl
keyword=reboot
keyword=halt
keyword=poweroff
prev=4/4/
prev-title=sudoとリダイレクト
next=4/6/
next-title=パッケージ管理

# 電源管理

みどり（通常）：
  お兄ちゃん！
  管理者になって
  よく行う操作って
  何だろうね？
しげる（通常）：
  すぐに思いつくのは電源管理だね
  Linux は複数のユーザが
  操作する前提なので
  電源管理はスーパユーザ
  1人だけの仕事なんだ！
みどり（通常）：
  へぇ…
  私にもその仕事を
  教えてよ！

## `shutdown` コマンド

しげる（通常）：
  `shutdown` は
  電源管理コマンドだよ

```bash
shutdown [オプション]... 時刻 [メッセージ]
```

オプション | 役割
---------- | ----
`-P`       | 電源オフ(デフォルト)
`-H`       | システム停止
`-r`       | 再起動
`-h`       | 電源オフ、システム停止が指定されていた場合はそれを上書きしない

時刻の例   | 意味
---------- | ----
`now`      | 今すぐ
`+30`      | 30分後に
`22:00`    | 22:00に

しげる（通常）：
  難しく考えずに
  以下の2つを
  覚えておけばいいよ

よく使う指定           | 意味
---------------------- | ----
`sudo shutdown -h now` | 今すぐ電源オフ
`sudo shutdown -r now` | 今すぐ再起動

みどり（通常）：
  うん！
  まずはこの指定を
  覚えておくね！

## `systemd` での電源管理

しげる（通常）：
  最近のディストリビューションでは
  `systemd` が電源を管理しているんだ
しげる（通常）：
  `systemd` が使われている場合
  プロセスの一番親になっているので
  `pstree` で確認してみよう

```bash
pstree
```

みどり（通常）：
  一番の親が
  `systemd` かどうか
  見ればいいんだね？

```console
systemd─┬─ModemManager───2*[{ModemManager}]
        ├─NetworkManager───2*[{NetworkManager}]
        ...
```

みどり（通常）：
  お兄ちゃんの言うとおり
  `systemd` だったよ！
しげる（通常）：
  この場合電源管理は
  `systemd` に任せるのが一般的だよ
  `systemd` を管理するコマンド
  `systemctl` で以下のようにするよ

コマンド                  | 動作
------------------------- | ----
`sudo systemctl poweroff` | 電源オフ
`sudo systemctl halt`     | システム停止
`sudo systemctl reboot`   | 再起動

みどり（通常）：
  `systemd` が電源管理している場合
  `shutdown` は使わないほうが
  いいのかな？
しげる（通常）：
  大丈夫だよ
  この場合 `shutdown` は
  `systemd` の作法に従って
  動いてくれるんだ

## 他の電源管理コマンド

しげる（通常）：
  最近のディストリビューションは
  親切なコマンドが
  多く用意されているんだ
  以下のコマンドでも
  電源管理ができる場合があるよ

コマンド        | 動作
--------------- | ----
`sudo poweroff` | 電源オフ
`sudo halt`     | システム停止
`sudo reboot`   | 再起動

みどり（笑顔）：
  コマンドだけというのは
  楽で覚えやすいね！

## まとめ

みどり（通常）：
  今回は電源管理の方法を学んだよ！
  いくつも方法があるんだね！
しげる（通常）：
  `shutdown` は
  ほとんどの環境で使えるので
  管理者の基本として覚えておこう！
  普段はどの方法を使っても大丈夫だよ！

