gem 'whenever', require: false

run_bundle

run 'bundle exec wheneverize .'

git add: "."

git commit: %Q{ -m 'wheneverの設定' }
