insert_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::API\n" do
  <<-RUBY
  rescue_from StandardError, with: :internal_server_error unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found unless Rails.env.development?

  private

  def internal_server_error(error = nil)
    return render json: { message: 'Internal Server Error' }, status: 500 if error.nil?
    render json: { message: error.full_message }, status: 500
  end

  def not_found(error = nil)
    return render json: { message: 'Record Not Found' }, status: 404 if error.nil?
    render json: { message: error.full_message }, status: 404
  end
  RUBY
end
