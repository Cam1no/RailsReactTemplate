repo = 'https://raw.githubusercontent.com/Cam1no/faster'
branch = 'master'

gemfile_url = "#{repo}/#{branch}/gemfile.rb"

file_attributes = {
  base: %w(application hello_react locale javascript),
  debug: %w(pry bullet rubocop),
  service: %w(circleci),
  spec: %w()
}

apply gemfile_url

file_attributes.each do |key, values|
  values.each do |value|
    apply "#{repo}/#{branch}/#{key}/#{value}.rb"
  end
end

# dots-env
run 'touch .env'

# convert slim
run 'bundle exec erb2slim -d app/views'

# capistrano
run 'bundle exec cap install'

# kaminari
run 'bundle exec rails g kaminari:config'

# change scss
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"

# whenever
run 'bundle exec wheneverize .'