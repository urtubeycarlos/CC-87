class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, stauts: :ok
  end

  private
  def user
    @user ||= User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password)
  end
end
