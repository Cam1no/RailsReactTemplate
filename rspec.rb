run 'bundle exec spring stop'

gem_group :development, :test do
  # rspec
  gem 'rspec-rails'
  gem 'faker'
  gem 'timecop'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
end

run_bundle
run 'bundle exec rails g rspec:install'

insert_into_file 'spec/spec_helper.rb', before: 'RSpec.configure do |config|' do
  <<~RUBY

  require 'factory_bot_rails'
  require 'simplecov'
  SimpleCov.start 'rails'
  RUBY
end

insert_into_file 'spec/spec_helper.rb', after: 'RSpec.configure do |config|' do
  <<-RUBY
  config.before :all do
    FactoryBot.reload
    FactoryBot.factories.clear
    FactoryBot.sequences.clear
    FactoryBot.find_definitions
  end
  config.include FactoryBot::Syntax::Methods
  RUBY
end

insert_into_file '.gitignore', after: "/vendor/bundle\n" do
  <<~TEXT
  /coverage/
  TEXT
end

git add: "."

git commit: %Q{ -m 'rspecの設定' }
