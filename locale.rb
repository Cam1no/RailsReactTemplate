# install locales
gem 'rails-i18n'
run_bundle

remove_file 'config/locales/en.yml'
run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/en.yml -P config/locales/'
run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -P config/locales/'

git add: '.'

git commit: %( -m 'localeを日本語化' )
