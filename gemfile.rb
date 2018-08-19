gem 'kaminari'
gem 'rails-i18n'
gem 'whenever', require: false
gem 'delayed_job_active_record'
gem 'slack-notifier'

gem_group :development do
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
end

run_bundle


git add: '.'

git commit: %( -m 'install gemfiles' )
