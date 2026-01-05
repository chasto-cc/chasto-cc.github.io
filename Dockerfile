# ------ build ------
FROM node:22.20.0-slim AS build

RUN npm install -g hexo-cli
WORKDIR /myblog
COPY package*.json ./
RUN npm install

COPY . .
RUN hexo clean && hexo g

# ------ runtime ------
FROM node:22.20.0-slim

RUN npm install -g hexo-cli
WORKDIR /myblog
COPY --from=build /myblog ./
ENTRYPOINT [ "hexo", "server" ]
EXPOSE 4000