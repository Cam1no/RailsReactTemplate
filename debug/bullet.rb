file 'config/initializers/bullet.rb', <<~CODE
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.console = false
  Bullet.add_footer = false
  Bullet.rails_logger = true
CODE

git add: '.'

git commit: %( -m 'setting bullet' )
