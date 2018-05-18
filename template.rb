# Use SASS extension for application.css
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"

gem 'dotenv-rails'
run_bundle
run 'touch .env'

create_file '.ruby-version', <<~EOF
2.5.0
EOF
