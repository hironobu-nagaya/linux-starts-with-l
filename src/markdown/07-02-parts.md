chapter=7
story=2
title=Raspberry Pi に必要な部品
keyword=Raspberry Pi
keyword=parts
prev=7/1/
prev-title=Raspberry Pi
next=7/3/
next-title=Raspberry Pi OS

# Raspberry Pi に必要な部品

みどり（笑顔）：
  えへへ！
  お兄ちゃんから Raspberry Pi 一式を
  譲ってもらっちゃった！
みどり（通常）：
  でもお兄ちゃん！
  本来ならどんなものを
  用意しないといけないの？
しげる（通常）：
  今回は Raspberry Pi を動かすのに
  必要な部品を紹介しよう！

## Raspberry Pi 本体

みどり（通常）：
  Raspberry Pi にはたくさん種類があるね！
しげる（通常）：
  その種類のことを「モデル(model)」と言うよ
  初めてなら通常モデルで入手性の良いものがいいね
  僕のおすすめは以下だよ

モデル                                                                            | CPU(コア数) | メモリ       | USB 端子                 | HDMI 端子     | 有線速度 | 無線LAN周波数 | 電源端子   | 電源要求 | 他の特徴
--------------------------------------------------------------------------------- | ----------- | ------------ | ------------------------ | ------------- | -------- | ------------- | ---------- | -------- | --------
[Raspberry Pi 3B](https://raspberrypi.com/products/raspberry-pi-3-model-b/)       | 1.2GHz × 4  | 1GB          | USB 2.0 × 4              | HDMI × 1      | 100Mbps  | 2.4GHz        | microUSB   | 5V 2.5A  | 低発熱・低消費電力
[Raspberry Pi 3B+](https://raspberrypi.com/products/raspberry-pi-3-model-b-plus/) | 1.4GHz × 4  | 1GB          | USB 2.0 × 4              | HDMI × 1      | 300Mbps  | 2.4GHz / 5GHz | microUSB   | 5V 2.5A  | 3B より発熱や消費電力が微増
[Raspberry Pi 4B](https://raspberrypi.com/products/raspberry-pi-4-model-b/)       | 1.8GHz × 4  | 1/2/4/8GB    | USB 2.0 × 2, USB 3.0 × 2 | microHDMI × 2 | 1Gbps    | 2.4GHz / 5GHz | USB Type-C | 5V 3A    | 性能と発熱が程よいバランス
[Raspberry Pi 5](https://raspberrypi.com/products/raspberry-pi-5/)                | 2.4GHz × 4  | 1/2/4/8/16GB | USB 2.0 × 2, USB 3.0 × 2 | microHDMI × 2 | 1Gbps    | 2.4GHz / 5GHz | USB Type-C | 5V 5A    | 高性能・高発熱、PCI Express 端子

みどり（通常）：
  発熱の話があるけど…
  どのぐらいの発熱なの？
しげる（通常）：
  あくまで僕の印象で
  環境や用途によっても変わるよ
  以下は参考程度に捉えてね

モデル               | 発熱状況
-------------------- | --------
Raspberry Pi 3B, 3B+ | ヒートシンクがあれば良いが無くても十分
Raspberry Pi 4B      | 放熱がしっかりしていればファンレス可能
Raspberry Pi 5       | ファンが無いと不安

しげる（通常）：
  Raspberry Pi の上限温度は 85 ℃だよ
  80 ℃を超えると自動で性能を下げて
  発熱を抑えるよう動くんだ
みどり（通常）：
  安全機能があるのね！
  よほどでない限りチップが焼けちゃう心配はないんだ！
しげる（通常）：
  また Raspberry Pi 5 からアクティブクーラが使えるよ
みどり（通常）：
  温度によってファンの速度をコントロールするやつだよね！
  負荷が少ないときに静かに運用できるのは嬉しいなぁ

## ケース

みどり（通常）：
  基板むき出しで使うのはちょっと怖いよね
しげる（通常）：
  ケースの素材から選ぶと迷いも少ないと思うよ
  モデルによって端子の位置が違うから
  対応するケースを選ぼう！

素材         | 特徴
------------ | ----
プラスチック | 安価、軽量、電波(Wi-Fi, Bluetooth)を妨害しない
金属         | 頑丈、放熱性が高い

## USB ケーブル、電源

しげる（通常）：
  USB 端子に電源供給できれば十分だよ
  端子の違いには気をつけよう！

モデル               | 電源端子
-------------------- | --------
Raspberry Pi 3B, 3B+ | microUSB
Rapberry Pi 4B, 5    | USB Type-C

みどり（通常）：
  スマートフォン充電に使うような
  USB ケーブルから給電してもいいのかな？
しげる（通常）：
  Raspberry Pi 4B 以前なら
  それで十分動く見込みがあるよ
しげる（通常）：
  Raspberry Pi 5 は 5V 5A という特殊な電源を要求するよ
  普通のスマートフォン充電はもっとアンペアが低いんだ
  アンペアが定格より低くても動作はするけど
  制限があったり動作が不安定になったりするんだ
しげる（通常）：
  Raspberry Pi 5 では可能であれば
  専用電源アダプタも用意しよう

## microSD カード

しげる（通常）：
  Raspberry Pi では
  microSD カードが
  ストレージになるんだ
みどり（通常）：
  どれだけ容量があればいいのかな？
しげる（通常）：
  公式ページでは以下が示されているよ

OS                              | 最低容量
------------------------------- | --------
Raspberry Pi OS Full (bookworm) | 32GB
Raspberry Pi OS Lite (bookworm) | 16GB

しげる（通常）：
  色々試して遊ぶことを考えると余裕があるといいね
  64 GB 以上を選ぶのがおすすめだよ

## microSD カードリーダ

しげる（通常）：
  microSD カードに OS を書き込む際に必要になるよ
  書き込むだけの用途なので特別な機能は不要だよ

## LAN ケーブル、ネットワーク機器

しげる（通常）：
  有線接続するなら LAN ケーブルが必要だよ

モデル             | Ethernet                      | 有線速度
------------------ | ----------------------------- | --------
Raspberry Pi 3B    | 100 Base Ethernet             | 100Mbps
Raspberry Pi 3B+   | Gigabit Ethernet over USB 2.0 | 300Mbps
Raspberry Pi 4B, 5 | Gigabit Ethernet              | 1Gbps

みどり（通常）：
  Raspberry Pi 3B+ は
  Gigabit Ethernet なんだけど
  速度は 1Gbps 出ないんだ？
しげる（通常）：
  内部で USB 2.0 に接続している構造なんだ
  より速度の遅い USB 2.0 に引っ張られて
  速度は最大 300Mbps になっているよ

## HDMI ケーブル、ディスプレイ

しげる（通常）：
  ディスプレイ接続するなら HDMI ケーブルが必要だよ
  モデルごとに端子が違うから注意してね！

モデル               | HDMI 端子
-------------------- | ---------
Raspberry Pi 3B, 3B+ | HDMI × 1
Raspberry Pi 4B, 5   | microHDMI × 2

しげる（通常）：
  Raspberry Pi 4B 以降は
  microHDMI 端子が2つあるんだ
  デュアルディスプレイも可能だよ
みどり（通常）：
  そうするつもりなら
  HDMI ケーブルやディスプレイを
  2組用意する必要があるね！

## キーボード、マウス

しげる（通常）：
  直接のターミナル操作や
  GUI を使う場合に必要だよ
  USB 接続のキーボードとマウスを用意しよう

## スピーカー

しげる（通常）：
  Raspberry Pi 4B 以前には
  3.5mm イヤホンジャック端子があるんだ
  サウンド出力を考えているのなら
  この端子で接続できるスピーカーを用意しよう
みどり（通常）：
  Raspberry Pi 5 には無いのね…
しげる（通常）：
  基板上にチップがそのままあるだけだからね
  シールドなどのノイズ対策が無く音質が良くないんだ
  人気がなく廃止されたみたいだよ
みどり（通常）：
  Raspberry Pi 5 ではサウンドを聴けないの？
しげる（通常）：
  HDMI 経由でサウンド出力できるし
  USB に対応機器を接続してもいいよ
  Raspberry Pi 用の「DAC(digital to analog converter)」基板もあるんだ

## まとめ

みどり（通常）：
  今回は Raspberry Pi を動かすのに
  必要なものを教えてもらったよ！
  Raspberry Pi 本体だけじゃなく
  他にも色々必要なんだね！
しげる（通常）：
  Raspberry Pi を動かすまでに初期費用が掛かるよ
  でも一度そろえれば追加の出費はほとんどないんだ
  これで Raspberry Pi を動かす準備ができたよ！

