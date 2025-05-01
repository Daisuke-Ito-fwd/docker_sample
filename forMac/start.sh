#!/bin/bash

# Dockerデーモンをバックグラウンドで起動
dockerd &

# 無限ループでコンテナを維持
tail -f /dev/null