chapter=6
story=17
title=Postfix
keyword=daemon
keyword=Postfix
keyword=MTA
prev=6/16/
prev-title=Apache HTTP Server
next=6/18/
next-title=S-nail

# Postfix

みどり（通常）：
  お兄ちゃん！
  メールもサーバで
  配信されているんだよね？
  自分でメールの運営もできるの？
しげる（通常）：
  もちろん！
  そのようなメールサーバプログラムを
  「MTA(mail transfer agent)」というよ
  今回は代表的な MTA である [Postfix](https://www.postfix.org/) を扱おう！

## インストール

しげる（通常）：
  Postfix のパッケージ名は `postfix` だよ
  パッケージ管理システムから
  インストールしよう

```bash
sudo apt install -y postfix
```

みどり（通常）：
  うん！
  インストールしたよ！

## 設定

しげる（通常）：
  今回は Postfix を
  この Linux 上だけで
  動くよう設定するよ
みどり（通常）：
  Linux 上だけで動くメールサーバ…
  外部の PC とは通信しないんだね
  どんなふうに使うのかな？
しげる（通常）：
  Linux 上のユーザ同士で
  メールを送受信したり
  デーモンがユーザへ
  通知メールを送るなどで使えるよ
みどり（通常）：
  へぇ…
  Linux 上だけの MTA でも
  色々使えそうだね！
しげる（通常）：
  Postfix 設定ファイルは
  `/etc/postfix/main.cf` だよ
  まずはバックアップを作成しよう！

```bash
sudo cp -av /etc/postfix/main.cf{,.dist}
```

みどり（通常）：
  うん！

```bash
sudo vim /etc/postfix/main.cf
```

設定項目           | 設定値                    | 説明
------------------ | ------------------------- | ----
`myhostname`       | `ホスト名` や `localhost` | ホスト名を使う場面でこの値が使われる
`myorigin`         | `ホスト名` や `localhost` | メールアドレスの `@` 以降の値になる
`my_network_style` | `host`                    | この Linux マシン上だけのメールサーバにする
`relay_domains`    | (空欄)                    | メールを中継しない

しげる（通常）：
  また以下の設定で
  値に何も指定されていない場合は
  `#` でコメントアウトしよう
  「指定なし」から
  Postfix デフォルトの設定値を
  使うようになるよ

* `sendmail_path`
* `newaliases_path`
* `mailq_path`
* `setgid_group`
* `html_directory`
* `manpage_directory`
* `sample_directory`
* `readme_directory`

しげる（通常）：
  以下で設定ファイルの
  文法や設定を確認してくれるよ

```bash
sudo postfix check
```

みどり（通常）：
  何も表示されなかったよ！
しげる（通常）：
  それなら何にも問題がないということだよ
  エラがーがあればそれを表示してくれるんだ

## 起動

しげる（通常）：
  では `postfix` デーモンを動かし
  自動起動を有効にしよう！

```bash
sudo systemctl enable --now postfix
```

しげる（通常）：
  問題なく起動したかどうかは
  以下で確認しよう！

```bash
systemctl status postfix
```

みどり（通常）：
  問題なく起動したよ！
しげる（通常）：
  Postfix を使って
  メールをやり取りするのは
  また別の操作を覚える必要があるんだ
  それは次回行うことにするね

## まとめ

みどり（通常）：
  今回は Postfix を扱ったよ！
  MTA でメール配信を行ってくれるんだ
しげる（通常）：
  メールサーバは
  スパムメールの配信目的で
  ひんぱんに攻撃に晒されるよ
  自宅の LAN の外でも動かすのなら
  ちゃんと勉強してから運用しよう
しげる（通常）：
  次回は Postfix で
  実際にメールを配信してみよう！

