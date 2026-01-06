#!/bin/bash
git pull

docker build -t myblog:latest .

docker compose up

rsync -avz --delete ./public root@10.0.0.1:/home/projects/ZHexoBlog/ --rsync-path="mkdir -p /home/projects/ZHexoBlog && rsync"