# ZHexoBlog

## Usage

- Install hexo-cli
```
npm install -g hexo-cli
```

- Create hexo project
```
hexo init ZHexoBlog
```

- Install dependencies
```
cd ZHexoBlog
npm install
```

- Install butterfly theme
```
npm install hexo-theme-butterfly

npm install hexo-generator-search
```

- Create pages
```
hexo new page categories
hexo new page tags
```
Add `type: "categories"` to `source/categories/index.md`   
Add `type: "tags"` to `source/categories/index.md`

- Generate public files and run server
```
hexo clean
hexo generate
hexo server
```

- Deploy
```
hexo deploy
```
