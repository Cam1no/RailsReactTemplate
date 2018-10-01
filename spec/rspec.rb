run 'bundle exec rails g rspec:install'

file '.rspec', <<~CODE
  --color
  --require spec_helper
  --format doc
CODE

insert_into_file 'spec/spec_helper.rb', <<RUBY, before: 'RSpec.configure do |config|'
require 'factory_bot_rails'
require 'simplecov'
require 'shoulda/matchers'
require 'vcr'
require 'pundit/matchers'
SimpleCov.start 'rails'

RUBY

insert_into_file 'spec/rails_helper.rb', <<RUBY, after: 'RSpec.configure do |config|'

  config.before :suite do
    DatabaseRewinder.clean_all
  end

  config.after :each do
    DatabaseRewinder.clean
  end

  config.before :all do
    FactoryBot.reload
    FactoryBot.factories.clear
    FactoryBot.sequences.clear
    FactoryBot.find_definitions
  end

  config.include FactoryBot::Syntax::Methods

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :active_record
      with.library :active_model
      with.library :action_controller
      with.library :rails
    end
  end

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = true
  end
RUBY

append_to_file '.gitignore', <<~CODE
  coverage
CODE

git add: "."

git commit: %Q{ -m 'setting rspec' }
