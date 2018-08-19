repo = 'https://raw.githubusercontent.com/Cam1no/faster'
branch = 'master'

gemfile_url = "#{repo}/#{branch}/gemfile.rb"
rubocop_url = "#{repo}/#{branch}/debug/rubocop.rb"

file_attributes = {
  base: %w(application hello_react locale javascript database job),
  debug: %w(pry bullet),
  service: %w(circleci acts_as_taggable_on),
  spec: %w(),
  authority: %w(pundit)
}

apply gemfile_url

file_attributes.each do |key, values|
  values.each do |value|
    if ENV['DEV']
      apply "#{File.dirname(__FILE__)}/#{key}/#{value}.rb"
    else
      apply "#{repo}/#{branch}/#{key}/#{value}.rb"
    end
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

# annotate
run 'bundle exec rails g annotate:install'

run 'rm -rf test'

run 'bundle exec spring binstub rspec'

# make dir
run 'mkdir app/services'
run 'mkdir app/tasks'
run 'mkdir app/serializers'
run 'mkdir app/callbacks'
run 'mkdir app/validators'
run 'mkdir app/notifiers'
run 'mkdir app/forms'

git add: '.'

git commit: %( -m 'setting misc' )

apply rubocop_url
