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
    - 'spec/spec_helper.rb'
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
inherit_from: .rubocop_todo.yml
YAML
