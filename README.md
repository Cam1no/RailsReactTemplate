# 初期設定
```
$ bundle init
$ vi Gemfile
## railsのコメントアウトを外す
$ bundle install --path vendor/bundle
$ bundle exec rails new .
$ bundle exec rails new . -d mysql --api --skip-test --webpack=react
```

### mysqlでこけた場合
```
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"
```


# railsアプリができた後に
```
wget https://raw.githubusercontent.com/Cam1no/RailsReactTemplate/master/setup.sh
sh setup.sh
```
