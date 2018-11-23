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


### rails server
```bin/rails s```

で3000版にサーバがたつ

### heroku　デプロイ
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
