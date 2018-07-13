gem 'slim-rails'
gem_group :development do
  gem 'html2slim'
end
gem_group :test do
  gem 'slim_lint'
end

run_bundle

run 'bundle exec erb2slim -d app/views'

git add: '.'

git commit: %( -m 'erbをslimに変換' )
