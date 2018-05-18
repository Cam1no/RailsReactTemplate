gem_group :development do
  gem 'html2slim'
end

run_bundle

run 'bundle exec erb2slim -d app/views'
