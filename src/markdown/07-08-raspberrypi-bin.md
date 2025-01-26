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
  Raspberry Pi 独自の機能やコマンドは無いのかな？
しげる（通常）：
  もちろんあるよ！
  今回は Raspberry Pi 独自の機能やコマンドを紹介しよう！

## モデル確認

しげる（通常）：
  Raspberry Pi のモデル情報は `/proc/device-tree/model` にあるよ
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

みどり（通常）：
  Raspberry Pi を何台も動かしている場合に便利そうだね！

## `raspi-config` コマンド

しげる（通常）：
  `raspi-config` は Raspberry Pi の各種設定を簡単に行えるようにした公式ツールだよ
  `root` ユーザで実行する必要があるから以下のように実行しよう

```bash
sudo raspi-config
```

みどり（通常）：
  Raspberry Pi Imager のカスタマイズで行ったような設定のほかさまざまな設定項目があるね
しげる（通常）：
  このコマンド1つで Raspberry Pi の基本的な設定が全てできるんだ

## `vcgencmd` コマンド

しげる（通常）：
  `vcgencmd` は Raspberry Pi のハードウェア情報を取得するよ
  `libraspberrypi-bin` パッケージに含まれているのでコマンドが見つからなければインストールしよう

```bash
sudo apt install -y libraspberrypi-bin
```

みどり（通常）：
  インストールしたら `vcgencmd` が見つかるようになったよ！
しげる（通常）：
  `vcgencmd` は引数で取得したい情報を指定するんだ
  例えば以下のようなものが指定されるよ

コマンド                         | 意味
-------------------------------- | ----
`vcgencmd measure_temp`          | 温度を表示
`vcgencmd measure_clock arm`     | CPU クロックを表示
`vcgencmd measure_clock core`    | GPU クロックを表示
`vcgencmd measure_volts core`    | CPU 電圧を表示
`vcgencmd measure_volts sdram_c` | メモリ電圧を表示
`vcgencmd commands`              | 指定できる引数を表示

みどり（驚き）：
  へぇ！
  こんなに詳しくハードウェアの情報を見られるんだ！
しげる（通常）：
  `watch` と組み合わせると継続的な確認に便利だよ

## まとめ

みどり（通常）：
  今回は Raspberry Pi 独自の機能やコマンドを学んだよ！
しげる（通常）：
  他にも電子工作やカメラ向けのコマンドなども用意されているんだ
  必要になったら調べて便利な機能を使いこなそう！

