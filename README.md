# 初期設定
```
$ bundle init

## railsのコメントアウトを外す
$ vi Gemfile

$ bundle install --path vendor/bundle
$ bundle exec rails new . -d mysql --api --skip-test --webpack=react

## vendor/bundle配下をignoreする
$ vi .gitignore

```

### mysqlでこけた場合
```
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"
```


# railsアプリができた後に
```
bundle exec rails app:template LOCATION=https://raw.githubusercontent.com/Cam1no/faster/master/setup.rb
```

## setting database
```
## databaseのusername/password等を変更する
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

## 起動
```
$ bundle exec rails s
## 別画面で
$ yarn dev
$ open http://localhost:3000
```
