# other
gem 'rubocop'

run_bundle

create_file '.rubocop.yml', <<YAML
AllCops:
  Exclude:
    - 'vendor/**/*'
    - 'bin/*'
    - 'config/**/*'
    - 'Gemfile'
    - 'db/**/*'
    - 'spec/**/*'
    - 'node_modules/**/*'
Rails:
  Enabled: true
Style/Documentation:
  Enabled: false
Style/FrozenStringLiteralComment:
  Enabled: false
Style/AsciiComments:
  Enabled: false
Style/PercentLiteralDelimiters:
  Enabled: false
Metrics/LineLength:
  Max: 120
inherit_from: .rubocop_todo.yml
YAML

git add: "."

git commit: %Q{ -m 'rubocopの設定' }

run "bundle exec rubocop -a --auto-gen-config"


git add: "."

git commit: %Q{ -m 'fix rubocop' }
