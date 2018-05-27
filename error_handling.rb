insert_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::API\n" do
  <<-RUBY
  rescue_from StandardError, with: :internal_server_error unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found unless Rails.env.development?

  private

  def internal_server_error(error = nil)
    return render json: { message: 'Internal Server Error' }, status: :internal_server_error if error.nil?
    render json: { message: error.full_message }, status: :internal_server_error
  end

  def not_found(error = nil)
    return render json: { message: 'Record Not Found' }, status: :not_found if error.nil?
    render json: { message: error.full_message }, status: :not_found
  end
  RUBY
end

create_file 'config/initializers/exceptions_app.rb', <<-RUBY
Rails.configuration.exceptions_app = ->(env) { ErrorsController.action(:error).call(env) }
RUBY

create_file 'app/controllers/errors_controller.rb', <<-RUBY
class ErrorsController < ActionController::API
  def error
    raise env['action_dispatch.exception']
  end
end
RUBY
