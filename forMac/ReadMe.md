---
marp: true
theme: default
paginate: true
header: "Docker Compose Hands-on Guide"
footer: "Docker Compose"
---

# Docker Compose Hands-on Guide

---

## 必要なファイル構成

```
forMac/
├── Dockerfile
├── docker-compose.yml
├── start.sh
└── ReadMe.md
```

---

## Docker Compose を使用した起動手順

1. **Docker Compose ファイルの確認**
   - `docker-compose.yml` を確認し、サービス設定を確認します。

---

## docker-compose.yml の内容

```yaml
version: '3.9'
services:
  ubuntu_fwd:
    image: ubuntu:latest
    container_name: ubuntu_fwd
    working_dir: /mnt/docker_sample
    privileged: true
    volumes:
      - ./docker_sample:/mnt/docker_sample:delegated
    ports:
      - "3001:3001"
```

---

## Docker Compose 起動手順

1. **Docker Compose を起動**
   ```bash
   $ docker-compose up -d
   ```

2. **コンテナの状態を確認**
   ```bash
   $ docker-compose ps
   ```

---

## コンテナ操作

1. **コンテナにアクセス**
   ```bash
   $ docker exec -it ubuntu_fwd /bin/bash
   ```

2. **コンテナを停止**
   ```bash
   $ docker-compose down
   ```

---

## start.sh の内容

```bash
#!/bin/bash

# Dockerデーモンをバックグラウンドで起動
dockerd &

# 無限ループでコンテナを維持
tail -f /dev/null
```

---

## Dockerfile の内容

```dockerfile
FROM ubuntu:22.04

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:en

RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen ja_JP.UTF-8 && \
    bash &&\
    curl &&\
    openrc &&\
    sudo &&\
    dpkg-reconfigure locales

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
```

---

## まとめ

- `docker-compose.yml` を使用して簡単にコンテナを管理可能。
- `start.sh` を活用して Docker デーモンを起動。
- 必要に応じて `Dockerfile` をカスタマイズ。
