if yes?('are you using mysql? y/n')
  remove_file 'config/database.yml'

  create_file 'config/database.yml', <<-YAML
  default: &default
    adapter: mysql2
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: <%= ENV['DB_USERNAME'] || 'root' %>
    password: <%= ENV['DB_PASSWORD'] || 'root' %>
    host: <%= ENV['DB_HOST'] || 'localhost' %>
    port: 3306
    encoding: utf8mb4
    socket: /tmp/mysql.sock

  development:
    <<: *default
    database: #{Rails.application.class.parent_name}_development

  test:
    <<: *default
    database: #{Rails.application.class.parent_name}_test
  YAML
end

git add: '.'

git commit: %( -m 'setting database' )
