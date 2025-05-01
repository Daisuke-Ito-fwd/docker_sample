---
marp: true
theme: default
paginate: true
header: "Docker Hands-on Guide"
---

# Docker Hands-on Guide

---

## やること
- Windows WSL(Ubuntu)+Docker / Mac+DockerUbuntu+Docker
  (DockerDesktopを使用する場合は、Dockerコンテナを起動する必要はありません ※業務使用は条件次第で有償)
- Gitリポジトリのクローン
- Dockerfileを作成
- Dockerイメージを作成
- Dockerコンテナを作成
- Dockerコンテナを起動
    - Dockerコンテナにアクセス
    - Flaskアプリを起動
    - Flaskアプリにアクセス
- Dockerコンテナを停止
- Dockerコンテナを削除
- Dockerイメージを削除

---

## Gitリポジトリのクローン
自身のPC内で任意の場所にリポジトリを作成してください。
```bash
$ git clone https://github.com/Daisuke-Ito-fwd/docker_sample.git
```

---

## ディレクトリ構成
```
docker_sample/
├── app/
│   ├── __init__.py
│   ├── routes.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── ReadMe.md
```

---
## ここから先は WSL(Ubuntu)での操作となります。
(Macの場合はUbuntuコンテナ内)
```
Windows
└─ WSL Ubuntu
    └─ docker_sample/
        ├─ app/
        ├─ sh/
        ├─ forMac/
        ├─ Dockerfile
        ├─ docker-compose.yml
        ├─ ReadMe.md
        └─ requirements.txt
```
---
```
Mac
└─ Ubuntu
    └─ docker_sample/
        ├─ app/
        ├─ sh/
        ├─ forMac/
        ├─ Dockerfile
        ├─ docker-compose.yml
        ├─ ReadMe.md
        └─ requirements.txt
```
---

## Dockerのインストール (便利シェル)

1. スクリプトをダウンロードして実行
   ```bash
   $ pwd
   /mnt/docker_sample
   $ cd sh
   $ curl -fsSL https://get.docker.com -o get-docker.sh
   $ sudo sh get-docker.sh
   ```

2. Dockerデーモンを起動
   ```bash
   $ dockerd &
   ```

---

## Dockerイメージをビルドする

1. ディレクトリ移動
   ```bash
   $ cd ..
   $ pwd
   /mnt/docker_sample
   ```

2. イメージをビルド
   ```bash
   $ docker build -t docker_sample .
   ```

3. 接続エラー時の対処
   ```bash
   $ cat /etc/resolv.conf
   $ echo "nameserver 8.8.8.8" > /etc/resolv.conf
   ```

---

## コンテナの作成 & 起動

1. コンテナを作成・起動
   ```bash
   $ pwd
   /mnt/docker_sample
   $ docker run -dit --name docker_sample \
       -p 3001:3001 \
       -v src:/mnt/src docker_sample
   ```
2. ブラウザでアクセス
   - http://localhost:3001

---

## コンテナ操作
0. コンテナの状態を確認・起動
   ```bash
   $ docker ps
   $ docker start docker_sample
   ```

1. コンテナにアクセス
   ```bash
   $ docker exec -it docker_sample /bin/bash
   ```

2. コンテナを停止
   ```bash
   $ docker stop docker_sample
   ```

3. コンテナを削除
   ```bash
   $ docker rm docker_sample
   ```

4. イメージを削除
   ```bash
   $ docker rmi <image_id>
   ```