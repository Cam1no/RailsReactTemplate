gem_group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-yarn'
  gem 'capistrano3-unicorn'
end

run_bundle

run 'bundle exec cap install'

git add: '.'

git commit: %( -m 'Capistrano init' )
