chapter=7
story=8
title=Raspberry Pi独自機能
keyword=libraspberrypi-bin
keyword=raspi-config
keyword=vcgencmd
prev=7/7/
prev-title=パッケージ自動更新
next=7/9/
next-title=ウォッチドッグ

# Raspberry Pi 独自機能

みどり（通常）：
  お兄ちゃん！
  Raspberry Pi 独自の
  機能やコマンドは無いのかな？
しげる（通常）：
  もちろんあるよ！
  今回は Raspberry Pi 独自の
  機能やコマンドを紹介しよう！

## モデル確認

しげる（通常）：
  Raspberry Pi のモデル情報は
  `/proc/device-tree/model` にあるよ
  このファイルでモデルを確認できるんだ

```bash
cat /proc/device-tree/model
```

みどり（通常）：
  へぇ…
  さっそく表示してみるね！

```console
Raspberry Pi 5 Model B Rev 1.0
```

## `raspi-config` コマンド

しげる（通常）：
  `raspi-config` は
  Raspberry Pi の各種設定を
  簡単に行えるようにした公式ツールだよ
  スーパユーザで実行する必要があるから
  以下のように実行しよう

```bash
sudo raspi-config
```

みどり（通常）：
  Raspberry Pi Imager のカスタマイズで
  行ったような設定のほか
  さまざまな設定項目があるね
しげる（通常）：
  このコマンド1つで
  Raspberry Pi の基本的な設定が
  全てできるんだ

## `vcgencmd` コマンド

しげる（通常）：
  `vcgencmd` は
  Raspberry Pi の
  ハードウェア情報を取得するよ
しげる（通常）：
  `libraspberrypi-bin` パッケージに
  含まれているので
  コマンドが見つからなければ
  インストールしよう

```bash
sudo apt install -y libraspberrypi-bin
```

みどり（通常）：
  インストールしたら
  `vcgencmd` が
  見つかるようになったよ！
しげる（通常）：
  `vcgencmd` は引数で
  取得したい情報を指定するんだ
  例えば以下のようなものが
  指定されるよ

コマンド                         | 意味
-------------------------------- | ----
`vcgencmd measure_temp`          | 温度を表示
`vcgencmd measure_clock arm`     | CPU 周波数を表示
`vcgencmd measure_clock core`    | GPU 周波数を表示
`vcgencmd measure_volts core`    | CPU 電圧を表示
`vcgencmd measure_volts sdram_c` | メモリ(コントローラ)電圧を表示
`vcgencmd commands`              | 指定できる引数を表示

みどり（驚き）：
  へぇ！
  こんなに詳しく
  ハードウェア情報を
  見られるんだ！
しげる（通常）：
  `watch` と組み合わせると
  継続的な確認に便利だよ

## まとめ

みどり（通常）：
  今回は Raspberry Pi 独自の
  機能やコマンドを学んだよ！
しげる（通常）：
  他にも電子工作やカメラ向けの
  コマンドなども用意されているんだ
  必要になったら調べて
  便利な機能を使いこなそう！

