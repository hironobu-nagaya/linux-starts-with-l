chapter=7
story=9
title=ウォッチドッグ
keyword=Raspberry Pi
keyword=watchdog
prev=7/8/
prev-title=Raspberry Pi独自機能
next=7/10/
next-title=UASP無効化

# ウォッチドッグ

みどり（通常）：
  お兄ちゃん！
  Raspbrerry Pi が
  応答しないと思ったら
  ハングアップしていたんだ！
  こういう場合に自動で再起動して
  くれたりすると助かるんだけど…
しげる（通常）：
  実はそういう機能があるんだ！
  「ウォッチドッグ(watchdog)」
  と呼ばれるよ
  Raspberry Pi には
  この機能があるから
  設定すれば利用できるよ！
みどり（通常）：
  「番犬」という意味だよね！
  とても頼りになりそう！

## 仕組み

みどり（通常）：
  でも…
  ハングアップしているのに
  どうしてその状態から
  再起動できるのかな？
しげる（通常）：
  ウォッチドッグは
  「ハードウェア」で
  実装されているんだ
  チップなどに内蔵されていて
  OS から独立しているよ！
みどり（通常）：
  なるほど！
  それなら OS がハングアップしても
  ウォッチドッグは動き続けられるね
しげる（通常）：
  ウォッチドッグは中で
  タイマーが動いているんだ
  タイマーが一定時間を過ぎると
  ハードウェアを再起動するように
  なっているよ
みどり（驚き）：
  それなら一定時間が来たら
  いつも再起動しちゃうよ？
しげる（通常）：
  そこで OS はウォッチドッグへ
  定期的にタイマーをリセットする
  信号を送っているんだ
みどり（通常）：
  なるほど！
  OS がハングアップしちゃうと
  信号が送られなくなって
  再起動するという仕組みなんだね！

## 有効化

しげる（通常）：
  まずはウォッチドッグの
  機能を有効にしよう
しげる（通常）：
  Raspberry Pi の機能を
  管理している設定ファイルは
  `/boot/firmware/config.txt` だよ
  そこの `[all]` セクションに
  以下の内容を記述しよう

```plaintext
dtparam=watchdog=on
```

しげる（通常）：
  これは以下のコマンドで
  実行できるよ

```bash
sudo sed -i.dist \
    '/^\[all\]'/a dtparam=watchdog=on' \
    /boot/firmware/config.txt
```

みどり（通常）：
  うん！
  実行したよ！
しげる（通常）：
  では内容を
  確認してみよう！

```bash
cat /boot/firmware/config.txt
```

みどり（通常）：
  お兄ちゃんのコマンドを
  信頼しているけど
  確認は大事だよね！

```console
...
[all]
dtparam=watchdog=on
...
```

みどり（通常）：
  うん！
  ちゃんと記述があるよ！
しげる（通常）：
  ウォッチドッグ有効化には
  再起動が必要なんだ
  まだ設定することが残っているから
  その設定を終えてから再起動するね

## 設定

しげる（通常）：
  ウォッチドッグの設定ファイルは
  `/etc/systemd/system.conf` だよ
  中身を見てみよう！

```bash
cat /etc/systemd/system.conf
```

みどり（通常）：
  `Watchdog` という
  言葉が入っている
  設定がいくつかあるね
しげる（通常）：
  `RuntimeWatchdogSec` という項目が
  「ウォッチドッグへ信号を送信する間隔（秒）」
  を表しているよ
  Raspberry Pi のウォッチドッグは
  15 秒で再起動するから
  それよりも小さな値を
  設定する必要があるんだ
しげる（通常）：
  ここでは `RuntimeWatchdogSec` の
  コメントアウト `#` を外して
  値を `off` から `10` に変更しよう

変更前

```plaintext
!start-class-silver!#RuntimeWatchdogSec=off!end!
```

変更後

```plaintext
RuntimeWatchdogSec=10
```

しげる（通常）：
  この変更は
  以下のコマンドで
  実現可能だよ

```bash
sudo sed -i.dist \
    's/^#\(RuntimeWatchdogSec\)=.*/\1=10/' \
    /etc/systemd/system.conf
```

みどり（通常）：
  うん！
  こっちも実行したよ！
しげる（通常）：
  ちゃんとそのような
  設定があるか
  確認してみよう！

```bash
grep '^RuntimeWatchdogSec=' /etc/systemd/system.conf
```

みどり（通常）：
  `grep` で
  指定された設定を
  検索するんだね！

```console
RuntimeWatchdogSec=10
```

みどり（通常）：
  うん！
  ちゃんと設定があったよ！
しげる（通常）：
  後は再起動すれば
  ウォッチドッグが
  動き始めるよ！

```bash
sudo systemctl reboot
```

## まとめ

みどり（通常）：
  今回はウォッチドッグの
  仕組みと設定を学んだよ！
しげる（通常）：
  特にヘッドレス運用している場合は
  ハングアップに気づくのが
  遅れがちになるよ
  その対策になる機能なので
  有効に活用しよう！

