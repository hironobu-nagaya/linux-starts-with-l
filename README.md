Lから始まるLinux
================

概要
----

兄妹の対話を通してLinuxへの理解を深めていくお話です

[Lから始まるLinux](https://hironobu-nagaya.github.io/linux-starts-with-l) - コンテンツ  
[hironobu-nagaya/linux-starts-with-l](https://github.com/hironobu-nagaya/linux-starts-with-l) - Git リポジトリ

免責など
--------

本連載について、以下をご了承の上お読み下さい

* 本連載は「正しさ」よりも「わかりやすさ」を優先しています
* 本連載に基づいた結果について、作者はいかなる責任も負いません
* 本連載は、実在の事件や出来事などは関係ありません
* 本連載は、特定の思想や宗教などを支持するものではありません
* 本連載の内容は、予告なく変更することがあります
* 本連載に登場する製品名などは、一般に各社の商標または登録商標です
* 本連載に、 ™, ©, ® などの記号は記載していません

ビルド
------

[linux-starts-with-l/bin/markdown2html](https://github.com/hironobu-nagaya/linux-starts-with-l/blob/main/bin/markdown2html) を実行すると  
[linux-starts-with-l/src/marcdown](https://github.com/hironobu-nagaya/linux-starts-with-l/tree/main/src/markdown) 配下の Markdown から HTML を生成します。  
生成された HTML は linux-starts-with-l/dest へ出力されます。

以下の変数からデフォルトを上書きできます。

変数       | 役割
---------- | ----
`DEST_DIR` | HTML 出力先ディレクトリのパス
`GREP`     | 使用する `grep` コマンド
`SED`      | 使用する `sed` コマンド
`AWK`      | 使用する `awk` コマンド

GNU 版 `grep`, `sed`, `awk` に依存しています。  
macOS の場合、これらのコマンドを  
GNU 版に差し替えて実行する必要があります。

例）

```bash
GREP=ggrep SED=gsed AWK=gawk markdown2html
```

