chapter=7
story=10
title=UASP無効化
keyword=Raspberry Pi
keyword=USB 3.0
keyword=UASP
keyword=lsusb
prev=7/9/
prev-title=ウォッチドッグ
next=8/1/
next-title=これから

# UASP無効化

みどり（通常）：
  お兄ちゃん！
  USB 3.0 に接続した USB メモリの読み込みがおかしいんだ
  ちょっと読み込んだと思ったら待たされたりして何だか安定して動いていないようなんだよ…
しげる（通常）：
  これは Raspberry Pi ユーザの間で有名な問題なんだ
  今回はこの対処法を紹介するね！

## 原因

しげる（通常）：
  ストレージを USB 3.0 に接続すると UASP(USB Attached SCSI Protocol) という高速通信を実現する仕組みが使われるんだ
  でも Raspberry Pi の USB コントローラと一部の USB ストレージの互換性が不完全で通信が不安定になる場合があるんだよ
  特に大容量データ転送時に顕著になることが多いんだ
みどり（通常）：
  高速化の仕組みなのに安定しなくて読み込みが遅くなると本末転倒だよ
  どうにかならないものなのかな？
しげる（通常）：
  UASP を無効にすることで対処できるよ
  今回はこの方法で対処するね

## USB ID 確認

しげる（通常）：
  `lsusb` は USB デバイス情報を表示するよ

```bash
lsusb [オプション]...
```

しげる（通常）：
  まずは USB デバイスを特定する「USB ID」という値を確認しよう
  問題の USB ストレージを接続し `lsusb` を実行してね

```bash
lsusb
```

みどり（通常）：
  へぇ！
  実行してみるね！

```console
...
Bus 001 Device 004: ID 1234:5678 Example USB Flash Drive
...
```

しげる（通常）：
  各行が USB デバイスの情報だよ
  自分の USB メモリのメーカ名などを手がかりにして
  `ID` の後ろにある `xxxx:xxxx` という番号をメモしよう
みどり（通常）：
  私の場合 `1234:5678` が USB ID だね！
  メモに控えておいたよ！

## 無効化

しげる（通常）：
  今度はこの USB デバイスで UASP を無効にするよう設定しよう
  設定ファイル `/boot/firmware/cmdline.txt` に以下の記述を記述するよ

```cmdline.txt
usb-storage.quirks=1234:5678:u
```

しげる（通常）：
  最初に `USB_ID` 変数に目的の USB ID `1234:5678` を設定しよう
  値は実際の内容に置き換えてね

```bash
USB_ID=1234:5678
```

みどり（通常）：
  設定したよ！
しげる（通常）：
  この変数を使って `sed` で設定を追記しよう！

```bash
sudo sed -i.dist \
  "s/$/ usb-storage.quirks=$USB_ID:u/" \
  /boot/firmware/cmdline.txt
```

みどり（通常）：
  できたよ！
しげる（通常）：
  では設定が記述されているか確認しよう

```bash
cat /boot/firmware/cmdline.txt
```

しげる（通常）：
  設定末尾に以下のような記述があるはずだよ
  これは USB ID が `xxxx:xxxx` の USB デバイスでは UASP を使わないという指定だよ

```cmdline.txt
usb-storage.quirks=xxxx:xxxx:u
```

みどり（通常）：
  `usb-storage.quirks=1234:5678:u` という記述があるね
  設定は大丈夫みたい！
しげる（通常）：
  設定ができたら再起動しよう！
  これで指定された USB デバイスで UASP が使われなくなるんだ

```bash
sudo systemctl reboot
```

みどり（驚き）：
  おお！
  再起動後は安定して USB メモリを読み込めるようになったよ！

## まとめ

みどり（通常）：
  今回は USB 3.0 の読み込みが不安定になる問題を UASP を無効にして解決したよ！
しげる（通常）：
  UASP が使われない場合「BOT (Bulk-Only Transport)」が使われるんだ
  BOT は UASP のような最適化が行われずアクセス速度は少し落ちるよ
  それでも USB 3.0 は USB 2.0 より十分高速で USB ストレージを利用可能だよ

