chapter=7
story=6
title=ブートローダ更新
keyword=Raspberry Pi
keyword=boot loader
keyword=rpi-eeprom-update
prev=7/5/
prev-title=ローカライズ
next=7/7/
next-title=パッケージ自動更新

# ブートローダ更新

みどり（通常）：
  お兄ちゃん！
  「ブートローダ(boot loader)」を更新すると
  新しい機能を使えるようになる場合があるみたい
  「ブートローダ」って何なのかな？
しげる（通常）：
  ブートローダは「起動時に OS を呼び出すソフトウェア」のことだよ
  Raspberry Pi の電源が入ると最初に動くソフトウェアなんだ
  microSD や USB ドライブ、ネットワークなどから
  OS を探して読み込んでくれるんだ
みどり（通常）：
  何だか更新は危ない印象だなぁ
  下手に触ると起動しなくなっちゃいそう…
しげる（通常）：
  Raspberry Pi にはブートローダの安全な更新を行う
  ツールが用意されているんだ
  今回はブートローダの更新について話そう！

## `rpi-eeprom-update` コマンド

しげる（通常）：
  `rpi-eeprom-update` は Raspberry Pi の
  ブートローダ更新ツールだよ

```bash
rpi-eeprom-update [オプション]...
```

しげる（通常）：
  `rpi-eeprom-update` は `rpi-eeprom` パッケージに含まれているよ
  もしコマンドが見つからなければインストールしよう！

```bash
sudo apt install -y rpi-eeprom
```

みどり（通常）：
  `rpi-eeprom-update` を使う準備は OK だよ！
しげる（通常）：
  まずはアップデートがあるかどうかを確認しよう

```bash
rpi-eeprom-update
```

みどり（通常）：
  うん！

```bash
*** UPDATE AVAILABLE ***
BOOTLOADER: update available
   CURRENT: Wed  5 Jun 15:41:49 UTC 2024 (1717602109)
    LATEST: Mon 23 Sep 13:02:56 UTC 2024 (1727096576)
   RELEASE: default (/lib/firmware/raspberrypi/bootloader-2712/default)
            Use raspi-config to change the release.
```

みどり（通常）：
  あっ！
  「アップデート利用可能(UPDATE AVAILABLE)」と
  目立つ表記があるよ！
しげる（通常）：
  それなら更新があるね
  ブートローダの更新は以下のようにするよ

```bash
sudo rpi-eeprom-update -a
```

しげる（通常）：
  注意があるよ
  ブートローダを更新中は電源を切らないようにね
  ブートローダが正しく動かず
  起動できなくなってしまう場合があるんだ

```console
*** PREPARING EEPROM UPDATES ***

BOOTLOADER: update available
   CURRENT: Wed  5 Jun 15:41:49 UTC 2024 (1717602109)
    LATEST: Mon 23 Sep 13:02:56 UTC 2024 (1727096576)
   RELEASE: default (/lib/firmware/raspberrypi/bootloader-2712/default)
            Use raspi-config to change the release.
   CURRENT: Wed  5 Jun 15:41:49 UTC 2024 (1717602109)
    UPDATE: Mon 23 Sep 13:02:56 UTC 2024 (1727096576)
    BOOTFS: /boot/firmware
'/tmp/tmp.dPExKx88EG' -> '/boot/firmware/pieeprom.upd'

UPDATING bootloader. This could take up to a minute. Please wait

*** Do not disconnect the power until the update is complete ***

If a problem occurs then the Raspberry Pi Imager may be used to create
a bootloader rescue SD card image which restores the default bootloader image.

flashrom -p linux_spi:dev=/dev/spidev10.0,spispeed=16000 -w /boot/firmware/pieeprom.upd
UPDATE SUCCESSFUL
```

みどり（通常）：
  ちょっと緊張したけど…
  無事更新が終わったみたい
みどり（通常）：
  ブートローダは起動時に動く
  ソフトウェアなんだよね？
  更新後は再起動すれば良いの？
しげる（通常）：
  そのとおり
  再起動すれば新しいブートローダが使われるよ！

```bash
sudo systemctl reboot
```

しげる（通常）：
  再起動したら再び `rpi-eeprom-update` を実行して
  ブートローダを確認してみよう

```bash
rpi-eeprom-update
```

みどり（通常）：
  どうなったかな？

```console
BOOTLOADER: up to date
   CURRENT: Mon 23 Sep 13:02:56 UTC 2024 (1727096576)
    LATEST: Mon 23 Sep 13:02:56 UTC 2024 (1727096576)
   RELEASE: default (/lib/firmware/raspberrypi/bootloader-2712/default)
            Use raspi-config to change the release.
```

みどり（通常）：
  「UPDATE AVAILABLE」の表示がなくなったよ
  確認できるのも安心だね！

## まとめ

みどり（通常）：
  今回はブートローダの更新を行ったよ！
  専用ツール `rpi-eeprom-update` を使うんだ！
しげる（通常）：
  ブートローダは Raspberry Pi の性能を引き出す大事なプログラムなんだ
  時々アップデートを確認して新しい機能や安定性を手に入れよう！

