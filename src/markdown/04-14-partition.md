chapter=4
story=14
title=パーティション
keyword=super user
keyword=root
keyword=partition
keyword=MBR
keyword=GPT
prev=4/13/
prev-title=マウント
next=4/15/
next-title=fdiskコマンド

# パーティション

みどり（通常）：
  お兄ちゃん！
  Linux から USB メモリを
  フォーマットしたい場合は
  どうするればいいのかな？
しげる（通常）：
  高度な話題になるので
  複数回に分けて説明するね
  今回は「パーティション(partition)」
  について話そう！

## パーティションとは

しげる（通常）：
  「パーティション」は
  ストレージの領域を
  分割して利用できるように
  する仕組みだよ
みどり（通常）：
  へぇ…
  分割して利用できるんだ！
しげる（通常）：
  分割すると複数のストレージが
  あるように使えるんだ
  分割しない場合でも
  「全領域を使った1つのパーティション」を作るよ
  いずれにしてもストレージ上には
  パーティションを作る必要があるんだ
しげる（通常）：
  代表的なパーティションの仕様に
  「MBR」と「GPT」の二つがあるよ

## MBR(master boot record)

しげる（通常）：
  MBR は昔の標準的な
  パーティション方式だったんだ
  これはストレージの先頭
  512 バイトの領域で
  パーティション構造を表しているよ
みどり（通常）：
  1 バイトって
  半角英数字1文字分のデータ量だよね
  512 バイトって少ない感じがするよ
しげる（通常）：
  昔はそれで十分だったんだ
  MBR ではその限られた容量から
  以下のような制限があるよ

* 基本パーティションは4つまで
* 認識できる容量は 2TB まで
* セキュアブート非対応

しげる（通常）：
  古い形式ではあるけど
  今でも USB メモリや
  SD カードなどで
  使われているよ

## GPT(GUID partition table)

しげる（通常）：
  GPT は MBR を置き換える目的で
  作られたパーティション方式だよ
  ストレージの先頭 512 バイトの領域は
  MBR と同じ構造をしていて
  互換性を持たせているんだ
みどり（通常）：
  つまり GPT では
  先頭 512 バイト以降も
  パーティションのデータが
  続くんだね
しげる（通常）：
  そういうことになるよ
  そのおかげで
  パーティション数や
  扱える容量は
  通常用途では制限なしと
  言って良いぐらい
  大きくなったんだ
  SSD や HDD では
  ほとんどの場合で
  GPT を使うよ

## まとめ

みどり（通常）：
  今回はパーティションを学んだよ！
  MBR と GPT という
  二つの方式が代表的なんだ！
しげる（通常）：
  次回は実際に
  パーティションを作ってみよう！

