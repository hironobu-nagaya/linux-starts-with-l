chapter=2
story=67
title=ネットワーク関連コマンド
keyword=ip
keyword=ping
keyword=traceroute
keyword=curl
keyword=wget
prev=2/66/
prev-title=システム関連コマンド
next=2/68/
next-title=その他のコマンド

# ネットワーク関連コマンド

みどり（通常）：
  お兄ちゃん！
  そろそろネットワークも
  扱えるようになりたいよ！
しげる（通常）：
  そうだね
  今回はネットワーク関連の
  コマンドを学んでいこう！

## `ip` コマンド

しげる（通常）：
  `ip` は
  ネットワーク設定を
  表示したり管理するよ

```bash
ip [オプション]... 対象 操作
```

みどり（通常）：
  私は細かな設定は
  しないと思うんだ
  IP アドレスの確認とか
  簡単な確認は
  どうすればいいかな？
しげる（通常）：
  それなら
  `ip addr show` だけを覚えよう
  `ip address show` の短縮形で
  確認でよく使われる指定だよ

```bash
ip addr show
```

みどり（通常）：
  どんな内容が
  出てくるのかな？

```console
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 12:34:56:78:90:ab brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.100/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0
       valid_lft 43376sec preferred_lft 43376sec
    inet6 240b:13:a120:1800:2e9b:cfb5:c0a7:7050/64 scope global dynamic noprefixroute
       valid_lft 279sec preferred_lft 279sec
    inet6 fe80::207:878:e024:218a/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether d8:3a:dd:88:74:ad brd ff:ff:ff:ff:ff:ff
```

しげる（通常）：
  この `lo`, `eth0`, `wlan0` などが
  ネットワークデバイスを表しているよ
  必要な項目をその配下の表示から読み取ろう

## `ping` コマンド

しげる（通常）：
  `ping` は
  接続先から応答が返るか確認するよ
  主にネットワーク疎通確認などで
  使われるんだ

```bash
ping [オプション]... 接続先
```

オプション    | 意味
------------- | ----
-c 回数       | ping を送信する回数（デフォルトは無制限）
-i 間隔（秒） | ping を送信する間隔（デフォルトは 1 秒）

みどり（通常）：
  応答が返ってこれば
  接続先へネットワークが
  繋っているって言えるのね
しげる（通常）：
  応答が返ってこなかった場合
  接続先が存在していない
  ネットワークに問題があるなど
  色々な原因が考えられるよ
しげる（通常）：
  また `ping` が届いても
  セキュリティ目的で
  あえて応答していない場合も
  あることも覚えておこう
しげる（通常）：
  実際に試してみよう
  `8.8.8.8` は Google が
  公開している DNS サーバだよ
  ここに ping を 4 回送ってみよう

```bash
ping -c 4 8.8.8.8
```

みどり（驚き）：
  おお！
  結果がどんどん
  追記されていくんだね！

```console
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=27.6 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=24.1 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=117 time=24.8 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=117 time=24.0 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3003ms
rtt min/avg/max/mdev = 23.968/25.106/27.585/1.464 ms
```

みどり（通常）：
  だいたい 25 ミリ秒で
  応答が返ってきているね
  ゲーマーが `ping` 値を
  気にするという話を
  聞いたことがあるけど
  どれだけサーバの応答が
  速く返ってくるかの
  目安になるんだね

## `traceroute` コマンド

しげる（通常）：
  `traceroute` は
  接続先に届くまでの
  経路を確認するよ

```bash
traceroute [オプション]... 接続先
```

しげる（通常）：
  `ping` と同じで
  途中の経路が応答しない場合もよくあるんだ
  あくまで簡易確認のつもりで使うといいよ
みどり（驚き）：
  へぇ！
  最終地点に到達できるかだけじゃなく
  途中の中継地点も確認できるんだね！
しげる（通常）：
  では `google.com` に到達するまでに
  どのような経路をたどっているか
  見てみよう！

```bash
traceroute google.com
```

みどり（通常）：
  `ping` と似ているね
  どんどん結果が
  追記されていくよ！

```console
traceroute to google.com (172.217.175.110), 30 hops max, 60 byte packets
 1  router.local (192.168.0.1)  0.598 ms  0.754 ms  0.947 ms
 2  200.200.200.200 (200.200.200.200)  6.132 ms  5.947 ms  6.793 ms
 3  210.210.210.210 (210.210.210.210)  23.377 ms  23.979 ms  23.812 ms
 4  220.220.220.220 (220.220.220.220)  25.470 ms  22.335 ms  25.664 ms
 5  * * *
 6  240.240.240.240 (240.240.240.240)  25.470 ms  22.335 ms  25.664 ms
 7  250.250.250.250 (250.250.250.250)  25.470 ms  22.335 ms  25.664 ms
```

しげる（通常）：
  7つの経路を経由して
   `google.com` に到着しているね
  5番目の経路は応答を返さなかったので
  情報が得られなかったことを示しているよ

## `curl` コマンド

しげる（通常）：
  `curl` は
  指定した URL から
  データを取得するよ

```bash
curl [オプション]... URL
```

オプション  | 意味
----------- | ----
-L          | リダイレクトをたどる
-o ファイル | 取得したデータをファイルに保存
-O          | 取得したデータを URL と同じ名前で保存

みどり（通常）：
  これで色々なファイルを
  インターネット経由で
  拾って来られるね！
しげる（通常）：
  ここでは
  `https://www.google.co.jp` から
  データを取得してみよう

```bash
curl https://www.google.co.jp
```

みどり（驚き）：
  わっ！
  たくさん文字が
  表示されたよ！
しげる（通常）：
  普段はブラウザが
  描画してくれる HTML の内容が
  そのまま出力されたんだね
しげる（通常）：
  指定が無ければこのように
  標準出力に出力されるんだ
  リダイレクトやオプションを
  指定してあげると
  その内容をファイルに
  保存できるよ

## `wget` コマンド

しげる（通常）：
  `wget` も
  指定した URL から
  データを取得するよ

```bash
wget [オプション]... URL
```

オプション          | 意味
------------------- | ----
--max-redirect=回数 | リダイレクトを最大指定した回数までたどる（デフォルトは 20）
-O ファイル         | 取得したデータをファイルに保存

みどり（通常）：
  `wget` は `curl` と
  何が違うのかな？
しげる（通常）：
  `wget` は
  ダウンローダなんだ
  大量のファイルを
  ダウンロードする場合に
  便利だよ
しげる（通常）：
  ダウンローダとしての
  使い方に興味があれば
  `man` で確認してね

```bash
man wget
```

## まとめ

みどり（通常）：
  今回はネットワーク関連コマンド
  `ip`, `ping`, `traceroute`,
  `curl`, `wget`
  を学んだよ！
しげる（通常）：
  これらのコマンドで
  データを取得したり
  ネットワークのトラブルシューティングができるよ
  最初はこのぐらいを
  押さえておけば十分だよ！

