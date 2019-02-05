
# herokuにデプロイしたもののリンク
https://docker-ruby-heroku.herokuapp.com/

# 環境構築
https://qiita.com/togana/items/30b22fc39fe6f7a188ec

ここを参考にした

dockerのruby imageからrails環境を作る


### dockerfile、docker-compose.ymlのコンパイル
```docker-compose build```

いらないimage削除しとく

```docker system prune -f```

### docker-compose up
```docker-compose up```
でコンテナたてる

### コンテナにはいる
```docker-compose exec app /bin/bash -l```


### 初回だけ
migrationとかdatabase createとかしてくれる
```./scripts/setup_docker.sh```

### rails server
```bin/rails s```

で3000版にサーバがたつ

### heroku　デプロイ
https://qiita.com/NaokiIshimura/items/eee473675d624a17310f

参考↑
```
heroku login
(git remote -v)
git push heroku master
```

### デバッグ
```
heroku logs -t
```

### マイグレーション
```
heroku run rake db:migrate
```

### 環境変数
ツイッターのapi用に環境変数設定しとく

heroku config:set 変数名=
heroku config:set CONSUMER_KEY=xxxxxx CONSUMER_SECRET=xxxx ACCESS_TOKEN=xxxx ACCESS_TOKEN_SECRET=xxxx
