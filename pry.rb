
gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-state'
  gem 'pry-coolline'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
end

run_bundle

create_file '.pryrc', <<RUBY
# awesome_print
begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts "no awesome_print :("
end
RUBY
