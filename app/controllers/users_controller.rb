class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  load_and_authorize_resource

  def index
    users = User.all
    render json: users, stauts: :ok
  end

  def show
    return render json: { errors: 'not found' }, status: :not_found unless user

    serializer = (@current_user.role == 'admin' ? UserDetailsSerializer : UserBasicDetailsSerializer)
    render json: user, serializer: serializer, status: :ok
  end

  private
  def user
    @user ||= User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password)
  end
end
