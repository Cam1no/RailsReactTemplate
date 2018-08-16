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

insert_into_file 'spec/rails_helper.rb' do
  <<~RUBY
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :active_record
      with.library :active_model
      with.library :action_controller
      with.library :rails
    end
  end
  RUBY
end

insert_into_file 'spec/rails_helper.rb', after: "require 'rspec/rails'\n" do
  <<~RUBY
  require 'shoulda/matchers'
  RUBY
end

git add: "."

git commit: %Q{ -m 'rspecの設定' }
