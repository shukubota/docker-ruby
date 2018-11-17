# docker-ruby
https://qiita.com/togana/items/30b22fc39fe6f7a188ec

ここを参考にした

dockerのruby imageからrails環境を作る


### dockerfile、docker-compose.ymlのコンパイル
```docker-compose build```

いらないimage削除しとく

```docker system prune -f```

### docker-compose up
```docker-compose up```
で3000番にrails serverたつ

### rails console, migrateとか
```docker-compose run --rm app rails c```

```docker-compose run --rm app rails db:migrate```


### コンテナの中に入る
```docker-compose exec app /bin/bash -l```
