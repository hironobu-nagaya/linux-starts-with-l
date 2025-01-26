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
javascripts=timesyncd.js

# `systemd-timesyncd`

みどり（通常）：
  お兄ちゃん！
  最初はどんなデーモンから
  手をつけたらいいかな？
しげる（通常）：
  それなら `systemd-timesyncd` がいいと思うよ
  NTP(Network Time Protocol) を使って
  システム時刻を正確に合わせてくれているんだ
  名前のとおり `systemd` と統合されている
  標準的なデーモンなんだよ
  以降、単に `timesyncd` と呼ぶね
みどり（通常）：
  へぇ…
  そんなデーモンが動いていたんだね
  早速時刻合わせをしてみようよ！

## 確認

しげる（通常）：
  その前にまず `timesyncd` が
  動いているか確認してみよう！

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
  もし `inactive` と表示されたり
  エラーが表示されたりしたら
  `timesyncd` は動いていないよ
  代わりに別の時刻合わせデーモン
  `chronyd` や `ntpd` が
  動いている可能性が高いんだ
  ここでは `timesyncd` の
  解説だけをするよ

## 設定

しげる（通常）：
  `timesyncd` の設定ファイルは
  `/etc/systemd/timesync.conf` だよ
みどり（通常）：
  さっそく編集しようよ！
しげる（通常）：
  設定ファイルは編集する前に
  バックアップを取ろうね
  設定を間違えて動かなくなっても
  簡単に元に戻せるんだ
みどり（通常）：
  確かにバックアップは重要だね！
しげる（通常）：
  ここでは拡張子 `.dist` を付けよう
  「ディストリビューションのデフォルト」
  という意味の拡張子だよ

```bash
sudo cp -v /etc/systemd/timesync.conf{,.dist}
```

みどり（通常）：
  バックアップを作ったよ！
  これで仮に動かなくなっても
  元の設定に戻せるね！
しげる（通常）：
  今度はエディタで
  設定ファイルを開こう

```bash
sudo vim /etc/systemd/timesync.conf
```

みどり（通常）：
  うん！
  いつでも編集できるよ！
しげる（通常）：
  今回は
  以下の2つを
  設定してみよう

項目        | 意味
----------- | ----
NTP         | 使用する NTP サーバ
FallbackNTP | 指定された NTP サーバが使えない場合の代用 NTP サーバ

しげる（通常）：
  ここでは
  以下のように
  設定してみてね

```timesync.conf
NTP=ntp.nict.jp
FallbackNTP=ntp1.jst.mfeed.ad.jp ntp2.jst.mfeed.ad.jp ntp3.jst.mfeed.ad.jp
```

みどり（通常）：
  設定した値は
  どういうものなのかな？
しげる（通常）：
  両者とも日本国内の
  信頼できる NTP サーバを
  指定しているよ

指定値                                                         | 意味
-------------------------------------------------------------- | ----
ntp.nict.jp                                                    | [情報通信研究機構(NICT)](https://nict.go.jp/) が提供する NTP サーバ
ntp1.jst.mfeed.ad.jp ntp2.jst.mfeed.ad.jp ntp3.jst.mfeed.ad.jp | [科学技術振興機構(JST)](https://jst.go.jp/) が提供する NTP サーバ

みどり（通常）：
  なるほど！
  この設定を保存すれば
  日本国内の NTP サーバを
  使ってくれるんだ！
しげる（通常）：
  `timesyncd` には
  設定ファイルの書式チェックコマンド
  `systemd-timesyncd-parser` があるよ
  以下を実行してみよう！

```bash
systemd-timesyncd-parser /etc/systemd/timesyncd.conf
```

みどり（通常）：
  何も表示されなかったよ！
しげる（通常）：
  問題があった場合は
  その内容が出力されるよ
  出力されたらその内容に従って
  設定ファイルを書き直そう！
しげる（通常）：
  ほとんどのデーモンは
  起動中に設定を変更しても
  再読み込みはしてくれないんだ
  設定を反映させるためには
  デーモンの再起動が必要だよ

```bash
sudo systemctl restart systemd-timesyncd
```

みどり（通常）：
  再起動できたよ！
  確認はどうすればいいのかな？
しげる（通常）：
  デーモンの起動状態は
  以下で確認しよう

```bash
systemctl status systemd-timesyncd
```

しげる（通常）：
  システム時刻との同期は
  システム時刻管理ツール
  `timedatectl` で確認しよう

```bash
timedatectl [オプション]... [timedatectlコマンド]
```

しげる（通常）：
  確認だけなら
  オプションや引数は不要だよ
  以下を実行しよう！

```bash
timedatectl
```

みどり（通常）：
  うん！

```console
               Local time: !start-class-jst-datetime!Sun 2025-01-05 10:50:40!end! JST
           Universal time: !start-class-utc-datetime!Sun 2025-01-05 01:50:40!end! UTC
                 RTC time: !start-class-utc-datetime!Sun 2025-01-05 01:50:40!end!
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
  今回は NTP デーモン `timesyncd` を扱ったよ！
  Linux システムの時刻合わせをしてくれるんだ
  確認は `timedatectl` から行えるよ!
しげる（通常）：
  時刻がずれていると
  ログの時刻を追えなくなったり
  証明書が使えなくなることがあるんだ
  正しい時刻を設定した状態で
  他のデーモンを動かそう！

