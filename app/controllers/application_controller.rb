class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    error_hash = { error: { message: exception.message } }
    render json: error_hash, status: :not_found
  end
end
