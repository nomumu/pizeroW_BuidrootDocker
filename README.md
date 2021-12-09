# pizeroW_BuildrootDocker

Buildrootを利用してRaspberryPi Zero W 用の軽量イメージファイルを作成するDocker環境です。  

## Git clone

```bash
$ git clone https://github.com/nomumu/pizeroW_BuidrootDocker.git
$ cd pizeroW_BuidrootDocker
```

## How to docker build

Dockerfileを使用してRaspberryPi用のBuildroot環境イメージを作成します。

```bash
pizeroW_BuidrootDocker$ docker build . -t pizerow_buildroot
```

## rootパスワードの変更

Buildrootへ設定するconfigファイルにrootユーザパスワードが設定されています。
```bash
pizeroW_BuidrootDocker$ cd articles/patches
pizeroW_BuidrootDocker/articles/patches$ vim defconfig.patch
```
次の行を適切な値に編集して下さい。
```
BR2_TARGET_GENERIC_ROOT_PASSWD="pi"
```


## 無線LANの設定

起動時に無線LAN接続するためには、次の場所にあるファイルへ接続したいSSIDとパスワードを入力して下さい。

```bash
pizeroW_BuidrootDocker$ cd articles/config/
pizeroW_BuidrootDocker/articles/config$ vim wpa_supplicant.conf
```

## docker run

作成したBuildroot環境を使用してSDカードイメージを作成します。

```bash
pizeroW_BuidrootDocker$ ./run.sh
```

`articles`ディレクトリ以下をdocker環境へマウントします。ダウンロードのために2GB程度の容量が必要になります。

## Install application

`articles/app`ディレクトリ内に追加アプリケーションを格納し、`startup.sh`から呼び出すようにするとシステム起動時に自動的に任意のアプリケーションを実行することができます。  
`startup.sh`はroot権限で実行されます。

## 作成したイメージ

articlesディレクトリへ作成されたsdcard.imgがコピーされます。

## イメージの書き込み

SDカードへの書き込み操作を行います。  
`of=/dev/sdX`を適切なデバイスファイル名に変更して下さい。

```bash
pizeroW_BuidrootDocker$ sudo dd if=articles/sdcard.img of=/dev/sdX bs=8M status=progress
```

