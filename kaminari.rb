gem 'kaminari'

run_bundle

run 'bundle exec rails g kaminari:config'

git add: "."

git commit: %Q{ -m 'Kaminariの設定' }
