chapter=8
story=1
title=これから
prev=7/10/
prev-title=UASP無効化
next=
next-title=

# これから

みどり（笑顔）：
  お兄ちゃん！
  また Linux でゲームサーバを動かすね！
しげる（笑顔）：
  もう普通の OS のように
  Linux を使えるようになったね
みどり（笑顔）：
  最初はゲームを遊びたかっただけだけど
  使っているうちに面白い OS だとわかったし
  サーバやネットワークの仕組みを学ぶのにも
  良い題材だということがわかったよ！
みどり（通常）：
  でも Linux ってこれだけじゃないよね？
  これまで紹介されていなかった使い方とか
  分野があれば教えてほしいなぁ

## GUI

しげる（通常）：
  まずは GUI だね！
みどり（通常）：
  GUI はアイコンなどで何をするプログラムかわかるし
  マウス操作は詳しく知らなくても
  直感的にすぐ操作できるよね！
しげる（通常）：
  ゲーム用途以外なら Windows や macOS などの
  商用 OS とほぼ変わりないことができるよ
  以下のような代表的なソフトウェアが利用可能なんだ！

分野               | ソフトウェア
------------------ | ------------
ブラウザ           | [Chromium](https://www.chromium.org/), [FireFox](https://www.mozilla.org/ja/firefox/), [SeaMonkey](https://www.seamonkey-project.org)
メール             | [ThunderBird](https://www.thunderbird.net/ja/)
オフィススイート   | [OpenOffice.org](https://www.openoffice.org/ja/), [LibreOffice](https://ja.libreoffice.org/)
ドローイングソフト | [GIMP](https://www.gimp.org), [Inkscape](https://inkscape.org/ja/)
音楽・動画再生     | [FFmpeg](https://www.ffmpeg.org/), [VLC](https://www.videolan.org/vlc/index.ja.html)

しげる（通常）：
  GUI は多くのリソースを使うよ
  用途によっては CUI だけで使う場合も多いんだ

## ツール

しげる（通常）：
  代表的なツールやコマンドを紹介したけど
  紹介できていないものもたくさんあるんだ
  以下にここで扱うには複雑過ぎたり
  特定のディストリビューション専門の
  ツールやコマンドを挙げるね

名称                       | 役割
-------------------------- | ----
`nftables`, `iptables`     | パケットフィルタリング
`ufw`                      | パケットフィルタリング(Debian 系)
`firewalld`,`firewall-cmd` | パケットフィルタリング(Red Hat 系)
`nmap`                     | ネットワーク分析
`wireshark`                | ネットワーク分析
`tripwire`                 | ファイル改ざん検知
`grub`                     | ブートローダ
`mdadm`                    | ソフトウェアRAID
`lvm`                      | LVM(logical volume management)

みどり（通常）：
  お兄ちゃんから基本的な扱い方は学んだんだもの！
  学ぶ必要が出てきたら時間は掛かるけど習得できると思う！

## コンピュータ言語

しげる（通常）：
  「コンピュータ言語(computer language)」も
  触れてこなかったものだよ！
みどり（通常）：
  それはどういうものなの？
しげる（通常）：
  人間の言葉は曖昧で複雑すぎて
  コンピュータが解釈するのは難しいんだ
しげる（通常）：
  一方、コンピュータの言葉は電圧の高低の二進数で
  人間が解釈するのも難しいんだよ
しげる（通常）：
  そこで、人間からもコンピュータからも
  まあまあ理解しやすい共通の言葉として作られたのが
  「コンピュータ言語」なんだ
みどり（通常）：
  つまりコンピュータ言語を学べば
  コンピュータにやってほしいことを
  直接伝えられるようになるんだね！
しげる（通常）：
  広く知られているコンピュータ言語には
  以下のようなものがあるよ

言語                                  | 方式         | 特徴
------------------------------------- | ------------ | ----
[Python](https://www.python.org/)     | インタプリタ | 標準的に導入されている場合が多い、機械学習や深層学習に強い
[Java](https://www.java.com/ja/)      | コンパイラ   | ほとんど OS で同じように動かせる
[Ruby](https://www.ruby-lang.org/ja/) | インタプリタ | 書きやすい
[PHP](https://www.php.net/)           | インタプリタ | Webアプリケーションに強い
[Perl](https://www.perl.org/)         | インタプリタ | ほとんどの Linux に標準的に導入されている、正規表現に強い
C, C++                                | コンパイラ   | この言語で作成されたパッケージが多くを占める

みどり（通常）：
  「インタプリタ」と「コンパイラ」の違いってなにかな？
しげる（通常）：
  コンピュータ言語で書かれた文章を
  「ソースコード(source code)」と呼ぶよ
しげる（通常）：
  「インタプリタ(interpreter)」はソースコードの解釈を
  コンピュータに伝えるのに対して
  「コンパイラ(compiler)」はソースコードから
  コンピュータがそのまま実行できる実行ファイルを作るんだ
しげる（通常）：
  コンパイラ方式の方がプログラム実行速度が速いけど
  ソースコードを修正したら実行ファイルを作り直す手間があるんだ
みどり（通常）：
  新しい言語を覚えるって大変な感じがするよ
  シェルスクリプトでやりたい処理は大体書けるので
  それでいいんじゃないかな？
しげる（通常）：
  シェルスクリプトではスクリプト内で
  コマンドが実行された数だけ
  プロセスが立ち上がっては消えていくよ
  プロセス生成は高コストな処理で
  シェルスクリプトは実行速度が遅いんだ
しげる（通常）：
  シェルスクリプトの規模が大きくなったり
  実行速度が気になり始めたら言
  語を学ぶ良い機会かもしれないね

## バージョン管理システム

しげる（通常）：
  何かを編集しているときに変更で動かなくなるのが怖くて
  過去のバージョンをコピーして残していないかな？
  「バージョン管理システム(version control system, VCS)」は
  このような問題を解決するツールなんだ
みどり（通常）：
  「新しいフォルダ(2)」「新しいフォルダ(2)(最新)」「新しいフォルダ(現時点最新)」
  …とか身に覚えがあるよ
  こういった状態を解決してくれるのね！
しげる（通常）：
  最近は [Git](https://git-scm.com/) が主流だよ
  主にソースコード管理に使われているけど
  バージョン管理をする目的ならどんなものにも適用できるよ
しげる（通常）：
  また Git のホスティングサービス [GitHub](https://github.co.jp/) は
  公開リポジトリであれば無料で使えるんだ
  ここでソースコードなどを公開している開発者も多くいるよ
みどり（通常）：
  このページも [GitHub で公開](https://github.com/hironobu-nagaya/linux-starts-with-l) されているのね！

## デーモン

しげる（通常）：
  代表的な各デーモンを軽く紹介したけど
  どれも最も基本的な使い方ばかりなんだ
  本格的に使うならちゃんと勉強する必要があるよ
みどり（通常）：
  特にセキュリティ周りとかはしっかりしておかないと
  「生兵法は大怪我のもと」になりそうだね
しげる（通常）：
  紹介していないデーモンもたくさんあるんだ
  代表的なのは「RDBMS(relational database management system)」だよ
  これはデータを保存するシステムで
  コンピュータ言語と一緒に使われることが多いんだ
みどり（通常）：
  データの保存ってファイルに保存じゃダメなの？
しげる（通常）：
  簡単な用途ならファイル保存で十分な場合もあるよ
  RDBMS はほぼ同時にデータ操作された場合の対処や
  何万何億件の中から必要なデータを素早く探すなど
  データ管理に特化した機能を提供してくれるんだ
  業務システムなどでは RDBMS などが使われるよ
みどり（驚き）：
  へぇ…
  そんなにすごい仕組みがあったんだ…
しげる（通常）：
  代表的な RDBMS には以下のようなものがあるよ

* [MySQL](https://www.mysql.com/jp/)
* [PostgreSQL](https://www.postgresql.org/)
* [MariaDB](https://mariadb.org/)
* [SQLite](https://www.sqlite.org/)
* [H2](https://www.h2database.com/)

しげる（通常）：
  他にも紹介しきれていない代表的なデーモンや
  システム、サービスなどを挙げておくね

名称                                                                | 役割
------------------------------------------------------------------- | ----
[MongoDB](https://www.mongodb.com/ja-jp)                            | ドキュメント指向データベースシステム
[Elasticsearch](https://www.elastic.co/jp/elasticsearch)            | 全文検索
[Fluentd](https://www.fluentd.org/)                                 | ログ収集・解析
[Grafana](https://grafana.com//ja/)                                 | ログ可視化
[WordPress](https://wordpress.com/ja/)                              | サイト作成
[Redmine](https://redmine.jp/)                                      | プロジェクト管理
[MediaWiki](https://www.mediawiki.org/wiki/MediaWiki/ja?uselang=ja) | Wiki サーバ
[OpenLDAP](https://www.openldap.org)                                | LDAP サーバ
[BIND](https://www.isc.org/bind/)                                   | DNS サーバ
[ProFTPD](http://www.proftpd.org/)                                  | FTP サーバ
[vsftpd](https://security.appspot.com/vsftpd.html)                  | FTP サーバ
[Exim](https://www.exim.org)                                        | SMTP サーバ(MTA)
[Dovecot](https://www.dovecot.org/)                                 | IMAP/POP3 サーバ
[CUPS](https://www.cups.org/)                                       | プリンタサーバ
[Tomcat](https://tomcat.apache.org)                                 | アプリケーションサーバ(Java)
[rsync](https://rsync.samba.org/)                                   | ファイル同期
NFS                                                                 | ネットワーク越しのマウント

## 仮想化

しげる（通常）：
  「仮想化(virtualization)」は
  ハードウェアをソフトウェアで再現することだよ
みどり（通常）：
  仮想化をするとどうなるの？
しげる（通常）：
  簡単にコンピュータやリソースを作成したり破棄できるんだ
  「もっと性能が良いコンピュータを作り直そう」とか
  「負荷が高いからもう一台コンピュータを追加」といったことが
  簡単にできるんだ
しげる（通常）：
  仮想化ツールには [VirtualBox](https://www.virtualbox.org) などがあるよ
みどり（通常）：
  ハードウェアで同じことをやろうとすると買い替えとかしないといけなくなるものね
しげる（通常）：
  最近では1つのプログラムを専用に動かす仮想環境
  「コンテナ(container)」が良く使われるよ
  これは [Docker](https://www.docker.com/ja-jp/) で一気に広まったね
しげる（通常）：
  また複数のコンテナを協調させて動かす
  「コンテナオーケストレーションツール(container orchestration tool)」が使われるよ
  [Kubernetes](https://kubernetes.io/ja/) が有名なんだ
しげる（通常）：
  Linux 環境も簡単に作って壊してを繰り返せるとなると
  手作業でセットアップはしたくないよね
  そういった作業を自動化する
  「構成管理ツール(configuration management tool)」があるんだ
  [Ansible](https://www.ansible.com/), [Chef](https://www.chef.io/), [Puppet](https://www.puppet.com/) などがあるよ
みどり（驚き）：
  仮想化だけですごい大きな分野なんだね！
しげる（通常）：
  仮想化はリソース、特にメモリをたくさん消費するよ
  仮想化で色々したいなら性能の良いマシンを用意しよう！

## クラウド

しげる（通常）：
  「クラウド(cloud)」は仮想化されたリソースを
  貸してくれるサービスだよ
みどり（通常）：
  「仮想のコンピュータ1台貸して下さい」
  と申し込めば借りれるの？
しげる（通常）：
  そうだよ
  仮想なのでほんの数分以内で用意してくれるし
  通常はリソースを使った分だけの
  利用料を支払えばいいんだ
  コンピュータ以外にもネットワークや
  ストレージなども借りられるよ
みどり（驚き）：
  それは便利だね！
しげる（通常）：
  有名なクラウドサービスに以下があるよ

* [AWS(Amazon Web Service)](https://aws.amazon.co.jp/jp/)
* [Google Cloud](https://cloud.google.com/?hl=ja)
* [Microsoft Azure](https://azure.microsoft.com/ja-jp)
* [DigitalOcean](https://www.digitalocean.com/)
* [Heroku](https://jp.heroku.com/)

## まとめ

みどり（通常）：
  今回は今まで教えてもらったことの
  さらに先には何があるかを教えてもらったよ！
  まだまだ色々なことがたくさんあるんだ！
しげる（通常）：
  このあたりからだんだん専門的になっていくよ
  ちゃんとした書籍を買って勉強するのをおすすめするよ！
みどり（通常）：
  それから…
みどり（笑顔）：
  お兄ちゃん！
  今まで色々教えてくれてありがとう！
しげる（笑顔）：
  いえいえ！
  どういたしまして！

