#!/bin/bash
git pull

docker build -t myblog:latest .

docker compose up