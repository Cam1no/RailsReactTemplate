create_file '.circleci/config.yml', <<-YAML
# Ruby CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-ruby/ for more details
#
version: 2
jobs:
  build:
    docker:
      - image: circleci/ruby:2.5.0-node
        environment:
        - RAILS_ENV: test
        - DB_HOST: 127.0.0.1
        - TZ: Asia/Tokyo
        - MYSQL_DATABASE: #{Rails.application.class.parent_name}_test
        - DB_USERNAME: #{Rails.application.class.parent_name}
        - DB_PASSWORD: #{Rails.application.class.parent_name}
        - DB_HOST: 127.0.0.1

      - image: circleci/mysql:5.7
        environment:
        - TZ: Asia/Tokyo
        - MYSQL_ROOT_PASSWORD: #{Rails.application.class.parent_name}
        - MYSQL_DATABASE: #{Rails.application.class.parent_name}_test
        - MYSQL_HOST: 127.0.0.1
        - MYSQL_USER: #{Rails.application.class.parent_name}
        - MYSQL_PASSWORD: #{Rails.application.class.parent_name}

    working_directory: ~/#{Rails.application.class.parent_name}

    steps:
      - checkout

      - run:
          name: deps
          command: |
            sudo apt-get update --fix-missing
            sudo apt-get install -y --force-yes --no-install-recommends mysql-client

      # Download and cache dependencies
      - restore_cache:
          keys:
          - v1-dependencies-{{ checksum "Gemfile.lock" }}
          # fallback to using the latest cache if no exact match is found
          - v1-dependencies-

      # Bundle install dependencies
      - run: bundle install --jobs=4 --retry=3 --path=vendor/bundle

      - run:
          name: Install dependencies
          command: yarn

      - save_cache:
          paths:
            - ./vendor/bundle
          key: v1-dependencies-{{ checksum "Gemfile.lock" }}

      # Database setup
      - run: RAILS_ENV=test bundle exec rake db:structure:load --trace

      - run:
          name: Run RuboCop
          command: RAILS_ENV=test bundle exec rubocop

      # run tests!
      - run:
          name: Run RSpec
          command: |
            RAILS_ENV=test bundle exec rspec
YAML

git add: '.'

git commit: %( -m 'setting circleci' )
