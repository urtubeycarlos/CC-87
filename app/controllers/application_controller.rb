class ApplicationController < ActionController::API
  def page_not_found
    render json: '418 I\'m a teapot', status: 418
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
end
