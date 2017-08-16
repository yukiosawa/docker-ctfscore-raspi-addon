docker-ctfscore-raspi-addon
===========================

[Docker版のCTFスコアサーバ](https://github.com/yukiosawa/docker-ctfscore)に、Raspberry Pi向けのLED点滅機能を付加します。

![ltika](https://user-images.githubusercontent.com/12450447/29386272-22b185e2-8316-11e7-8a43-d2da3206db48.jpg)


## 説明
Raspberry Piをスコアサーバとする場合、問題正解時にLEDをチカチカさせることができます。
- 必要なもの
    - LED、抵抗器 ... 各3個
    - ブレッドボード ... 1個
    - ジャンパーワイヤー ... 必要数


## 環境構築
- Raspbian Jessie で検証済み

- 事前準備
Raspberry Piに[Docker版のCTFスコアサーバ](https://github.com/yukiosawa/docker-ctfscore)を導入して動作確認しておく。確認後は、`sudo ./docker-rm.sh`でコンテナ削除しておく。

- docker-ctfscoreダウンロード
```
$ cd ~
$ git clone https://github.com/yukiosawa/docker-ctfscore-raspi-addon.git
$ cd docker-ctfscore-raspi-addon
```

- Dockerイメージのビルド
```
$ sudo ./docker-build.sh
```

- LED配線
    - GPIOの16番、20番、21番を使ってLEDの点滅制御を行うので、それぞれにLEDと抵抗を配線する。[ここ](http://deviceplus.jp/hobby/raspberrypi_entry_009/)とか[ここ](http://iwasakiyouhei.com/post-2118/)を参考にした。
    - Dockerコンテナを起動し、コンテナ内のスクリプトを実行してLED点滅することを確認する。
    ```
    $ sudo ./docker-run.sh
    $ sudo ./docker-shell.sh
    (Dockerコンテナ内)
    # /var/www/ctfscore/etc/scripts/ltika.py
    ```

- Dockerコンテナの起動・停止・保守用スクリプトについて
[Docker版のCTFスコアサーバ](https://github.com/yukiosawa/docker-ctfscore)の手順と同じ。ただし、コマンド実行時のカレントディレクトリは`docker-ctfscore-raspi-addon`であることに注意。

