class ChatsController < ApplicationController
  before_action :authorize_request

  def index
    all_chats = chats.paginate(page: params[:page], per_page: 10).oder('created_at ASC')
    return render json: '204 No Content', status: :no_content if !chats || all_chats.empty?
    render render json: all_chats, status: :ok
  end

  def messages
    all_messages = chat_messages.paginate(page: params[:page], per_page: 15).order('created_at ASC')
    return render json: '204 No Content', status: :no_content if !all_messages || all_messages.empty?
    render render json: all_messages, status: :ok
  end

  private
  def chat()
    @chat ||= Chat.find_by_id(params[:id])
  end

  def chats(user_id = @current_user.id)
    Chat.where('user1=? OR user2=?', user_id, user_id)
  end

  def chat_messages(user_id = @current_user.id)
    Chat.includes(:messages).where('(user1=? OR user2=?) AND id=?', user_id, user_id, params[:id]).messages
  end
end
