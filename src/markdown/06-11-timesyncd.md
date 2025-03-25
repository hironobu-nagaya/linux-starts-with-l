chapter=6
story=11
title=systemd-timesyncd
keyword=daemon
keyword=systemd-timesyncd
keyword=timedatectl
prev=6/10/
prev-title=/runディレクトリ
next=6/12/
next-title=sysstat

# `systemd-timesyncd`

みどり（通常）：
  お兄ちゃん！
  最初はどんなデーモンから手をつけたら良いかな？
しげる（通常）：
  それなら `systemd-timesyncd` が良いと思うよ
  NTP(Network Time Protocol) を使ってシステム時刻を正確に合わせてくれているんだ
  名前のとおり `systemd` と統合されている標準的なデーモンなんだよ
  以降、単に `timesyncd` と呼ぶね
みどり（通常）：
  へぇ…
  そんなデーモンが動いていたんだね
  早速時刻合わせをしてみようよ！

## 確認

しげる（通常）：
  その前にまず `timesyncd` が動いているか確認してみよう！

```bash
systemctl is-active systemd-timesyncd
```

みどり（通常）：
  そっか…
  まずは確認だね！

```console
active
```

みどり（通常）：
  `timesyncd` が動いていたよ！
しげる（通常）：
  もし `inactive` と表示されたら `timesyncd` は動いていないよ
  別の時刻合わせデーモン `chronyd` や `ntpd` が動いている可能性が高いんだ
  ここでは `timesyncd` の解説だけをするよ

## 設定

しげる（通常）：
  `timesyncd` の設定ファイルは `/etc/systemd/timesync.conf` だよ
みどり（通常）：
  さっそく編集しようよ！
しげる（通常）：
  設定ファイルは編集する前にバックアップを取ろうね
  設定を間違えて動かなくなっても簡単に元に戻せるんだ
みどり（通常）：
  確かにバックアップは重要だね！
しげる（通常）：
  ここでは拡張子 `.dist` を付けよう
  「ディストリビューションのデフォルト設定」という意味の拡張子だよ

```bash
sudo cp -v /etc/systemd/timesync.conf{,.dist}
```

みどり（通常）：
  バックアップを作ったよ！
  これで仮に動かなくなっても元の設定に戻せるね！
しげる（通常）：
  今度はエディタで設定ファイルを開こう

```bash
sudo vim /etc/systemd/timesync.conf
```

みどり（通常）：
  うん！
  いつでも編集できるよ！
しげる（通常）：
  今回は、以下の2つを設定してみよう

項目        | 意味
----------- | ----
NTP         | 使用する NTP サーバ
FallbackNTP | 指定された NTP サーバが使えない場合の代用 NTP サーバ


しげる（通常）：
  ここでは以下のように設定してみてね

```timesync.conf
NTP=ntp.nict.jp
FallbackNTP=ntp1.jst.mfeed.ad.jp ntp2.jst.mfeed.ad.jp ntp3.jst.mfeed.ad.jp
```

みどり（通常）：
  設定した値はどういうものなの？
しげる（通常）：
  両者とも日本国内の信頼できる NTP サーバを指定しているよ

指定値                                                         | 意味
-------------------------------------------------------------- | ----
ntp.nict.jp                                                    | [情報通信研究機構(NICT)](https://nict.go.jp/) が提供する NTP サーバ
ntp1.jst.mfeed.ad.jp ntp2.jst.mfeed.ad.jp ntp3.jst.mfeed.ad.jp | [科学技術振興機構(JST)](https://jst.go.jp/) が提供する NTP サーバ

みどり（通常）：
  なるほど！
  これを保存すれば日本国内の NTP サーバを使ってくれるんだ！
しげる（通常）：
  ほとんどのデーモンは起動中に設定を変更しても
  再読み込みはしてくれないんだ
  設定を反映させるためには再起動が必要だよ

```bash
sudo systemctl restart systemd-timesyncd
```

みどり（通常）：
  再起動できたよ！
  確認はどうすれば良いのかな？
しげる（通常）：
  デーモンの起動状態だけなら以下で確認可能だよ

```bash
systemctl status systemd-timesyncd
```

しげる（通常）：
  システム時刻との同期は `timedatectl` で確認しよう
  `timedatectl` はシステム時刻管理ツールだよ

```bash
timedatectl [オプション]... [timedatectlコマンド]
```

しげる（通常）：
  確認だけならオプションや引数は不要だよ
  以下を実行しよう！

```bash
timedatectl
```

みどり（通常）：
  うん！

```console
               Local time: Sun 2025-01-05 10:50:40 JST
           Universal time: Sun 2025-01-05 01:50:40 UTC
                 RTC time: Sun 2025-01-05 01:50:40
                Time zone: Asia/Tokyo (JST, +0900)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

みどり（通常）：
  「System clock synchronized: yes」と
  「NTP service: active」って表示があるね
  時刻合わせがうまく行ったみたい！

## まとめ

みどり（通常）：
  今回は時刻合わせデーモン `timesyncd` を扱ったよ！
  確認は `timedatectl` から行えるんだ!
しげる（通常）：
  時刻がずれているとログの時刻を追えなくなったり
  証明書が正しく使えなくなることがあるんだ
  正しい時刻を設定した状態で他のデーモンを動かそう！

