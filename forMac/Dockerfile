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

# Dockerデーモンを起動するスクリプトを追加
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# デフォルトでDockerデーモンを起動
CMD ["/usr/local/bin/start.sh"]