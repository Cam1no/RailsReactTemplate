gem 'whenever', require: false

run_bundle

run 'bundle exec wheneverize .'

insert_into_file 'config/schedule.rb', after: "Learn more: http://github.com/javan/whenever\n" do
  <<~RUBY
  set :output, 'log/crontab.log'
  set :environment, :production

  every 1.minutes do
    Rails.logger.debug '-------------'
    Rails.logger.debug 'Whenever実行中'
    Rails.logger.debug '-------------'
  end
  RUBY
end

git add: "."

git commit: %Q{ -m 'wheneverの設定' }
