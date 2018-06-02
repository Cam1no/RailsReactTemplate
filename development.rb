gem_group :development do
  gem 'meta_request'
  gem 'dotenv-rails'
  gem 'metric_fu'
end

run_bundle
run 'touch .env'

git add: "."

git commit: %Q{ -m 'devで使える設定' }
