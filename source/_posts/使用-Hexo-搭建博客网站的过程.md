---
title: 使用 Hexo 搭建博客网站的过程
date: 2026-01-08 20:54:54
tags:
  - 技术
  - Hexo
categories:
  - 技术
---
# 前言
相比于完全自己开发博客网站项目，Hexo 为博客网站的实现提供了现成的，完善的解决方案，能够让想要搭建个人博客网站的人们专注于博客内容本身，而不是专注于开发和维护博客网站项目。Hexo 搭建速度快，简单易用，功能全面，而且可以由 Github Pages 托管，实现自动化部署，也无需自己去申请域名，租云服务器解决公网 IP 的问题，是搭建个人博客网站理想的工具。   


# 项目搭建
## 安装环境
### 1. 安装 Git
- Windows
  - 下载并安装 [Git](https://git-scm.com/install/windows)    

- Linux（Ubuntu, Debian）
使用以下命令
```
sudo apt-get install git-core
```


### 2. 安装 Node.js
- [Nodejs](https://nodejs.org/zh-cn/download/)


### 3. 安装 Hexo
在 node 环境下使用 npm 安装 Hexo 命令行工具
```
npm install -g hexo-cli
``` 

也可以使用 npm 局部安装 hexo 包
```
npm install hexo
```
安装 Hexo 时需要注意 hexo 与 node 的版本兼容性，具体参阅 Hexo 官方提供的 [Nodejs 版本限制文档](https://hexo.io/zh-cn/docs/)


## 创建并运行 Hexo 项目
Hexo 环境安装完成后，使用以下命令创建 Hexo 项目
```
hexo init <project-name>
cd <project-name>
npm install
```

使用以下命令运行 Hexo 项目，等待程序运行起来后，浏览器访问 http://localhost:4000 即可看到默认项目的页面
```
hexo server
```

## 项目配置
hexo 项目配置基本都在创建项目中的 `_config.yml` 中进行更改   
具体配置方法请参阅 [官方配置文档](https://hexo.io/zh-cn/docs/configuration)

## 常用的命令
- 创建博客
```
hexo new post <post-name>
```

- 创建页面
```
hexo new page <page-name>
```

- 创建草稿
```
hexo new draft <draft-name>
```

- 发布草稿
```
hexo publish <draft-name>
```

- 生成静态文件
```
hexo generate
```

- 清除静态文件
```
hexo clean
```

- 启动服务器
```
hexo server
```

- 部署站点
```
hexo deploy
```


## 安装主题
Hexo 有很多主题可供选择，其中有许多主题是由社区贡献的，可以访问 Hexo 官方网站的 [主题页面](https://hexo.io/themes/)   

以下方法以 [Butterfly](https://butterfly.js.org/) 为例

### 1. 安装主题
- 通过 git 直接克隆主题仓库
```
git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
```

- 也可以通过 npm 安装主题的依赖
```
npm install hexo-theme-butterfly
```

### 2. 安装主题依赖
安装渲染器等依赖
```
npm install hexo-renderer-pug hexo-renderer-stylus --save
```

如果需要搜索功能需要安装以下依赖
```
npm install hexo-generator-search
```

### 3. 修改配置文件
安装主题之后并没有立即生效，需要修改 hexo 项目中的配置文件 `_config.yml` 中的 `theme` 字段
```
theme: butterfly
```

将主题包中的 `_config.yml` 配置文件重命名为 `_config.butterfly.yml` 的形式，并将该配置文件放在与 hexo 项目配置文件 `_config.yml` 相同的项目根目录下，这样可以防止更改主题导致主题配置文件丢失，方便维护。

有关主题的配置都在 `_config.butterfly.yml` 中进行配置，具体配置项的说明参阅主题 [butterfly 配置文档](https://butterfly.js.org/posts/4aa8abbe/)


### 4. 其他问题
在使用 Butterfly 主题时，会发现项目的分类页面（categories）和标签（tags）页面无法访问，需要进行以下操作。

1. 创建 categories 与 tags 的页面
```
hexo new page categories
hexo new page tags
```

2. 手动添加页面的类型   

    创建 categories 与 tags 的页面后，会自动生成 `~/source/categories/index.md` 和 `~/source/tags/index.md`   

    在 `~/source/categories/index.md` 添加 `type: "categories"`   
    在 `~/source/tags/index.md` 添加 `type: "tags"`
    经过以上操作，在添加有标签和分类的 Post 后，分类页面和标签页面会显示正常。


## 部署
可以将项目部署到 Github 或 GitLab 具体请参阅 [部署方法](https://hexo.io/zh-cn/docs/github-pages)

执行以下代码将项目的静态文件部署
```
hexo clean
hexo generate
hexo deploy
```