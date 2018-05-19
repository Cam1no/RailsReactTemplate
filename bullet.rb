gem_group :development do
  gem 'bullet'
end

run_bundle

insert_into_file 'config/environments/development.rb', after: 'config.file_watcher = ActiveSupport::EventedFileUpdateChecker' do
  <<-RUBY

  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = false
    Bullet.add_footer = false
    Bullet.rails_logger = true
  end
  RUBY
end

git add: "."

git commit: %Q{ -m 'bulletの設定' }
