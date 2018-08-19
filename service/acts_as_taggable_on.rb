run 'bundle exec rake acts_as_taggable_on_engine:install:migrations'

run 'bundle exec rake acts_as_taggable_on_engine:tag_names:collate_bin'

run 'bundle exec rake db:migrate'

git add: '.'

git commit: %( -m 'install acts_as_taggable_on' )