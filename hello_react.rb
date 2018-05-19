create_file 'app/controllers/react_controller.rb', <<-RUBY
class ReactController < ActionController::Base
  def root
  end
end
RUBY

create_file 'app/views/react/root.html.slim', <<-SLIM
= javascript_pack_tag 'application'
SLIM


insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
  <<-RUBY
  root to: 'react#root'
  RUBY
end
