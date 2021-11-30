class MessagesController < ApplicationController
  def index
    @messages = Message.all  
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(status: ok)
    end
  end

private
  def message_params
    params.require(:message).permit(:user, :text)
  end
end