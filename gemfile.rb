gem 'kaminari'
gem 'rails-i18n'
gem 'whenever', require: false
gem 'delayed_job_active_record'
gem 'slack-notifier'
# gem 'ancestry'
gem 'counter_culture'
gem 'csv_shaper'
gem 'draper'
gem 'email_validator'
gem 'rails-observers'
# gem 'stream_rails' https://github.com/GetStream/stream-rails
gem 'validate_url'
gem 'pundit'

gem_group :development do
  gem 'derailed_benchmarks' # https://techracho.bpsinc.jp/hachi8833/2018_03_29/51875
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'bullet'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-yarn'
  gem 'capistrano3-puma'
  gem 'meta_request'
  gem 'dotenv-rails'
  gem 'metric_fu'
  gem 'html2slim'
  gem 'rubocop'
  gem 'annotate'
end

gem_group :test do
  gem 'slim_lint'
  gem 'parallel_tests'
end

gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-state'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  # rspec
  gem 'rspec-rails'
  gem 'faker'
  gem 'timecop'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
  # spring
  gem 'spring'
  gem 'spring-commands-rspec'
end

run_bundle


git add: '.'

git commit: %( -m 'install gemfiles' )
