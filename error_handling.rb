insert_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::API\n" do
  <<-RUBY
  rescue_from StandardError, with: :internal_server_error unless Rails.env.development?
  unless Rails.env.development?
    rescue_from(NoMemoryError,
                ScriptError,
                Interrupt,
                SecurityError,
                SignalException,
                SystemExit,
                SystemStackError, with: :only_logging)
  end
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

  def only_logging(error = nil)
    # TODO
    # need emergency notify
    Rails.logger.warn('System Error') if error.nil?
    Rails.logger.warn(error.full_message)
  end
  RUBY
end
