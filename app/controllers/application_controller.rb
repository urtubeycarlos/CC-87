class ApplicationController < ActionController::API
  def current_user
    @current_user
  end

  def authorize_request
    header = request.headers['Authorization']
    header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: '401 Unauthorized', status: :unauthorized
    rescue JWT::DecodeError => e
      render json: '401 Unauthorized', status: :unauthorized
    end
  end

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    render json: exception.message, status: :unauthorized
  end
end
