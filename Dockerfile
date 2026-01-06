# ------ build ------
FROM node:22.20.0-slim

RUN npm install -g hexo-cli
WORKDIR /myblog
COPY package*.json ./
RUN npm install