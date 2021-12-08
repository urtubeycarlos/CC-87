class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    puts params.inspect
    @message = Message.new(message_params)
    if @message.save
       render "new"
    end
  end

private
  def message_params
    params.require(:message).permit(:active)
    params.require(:user).permit(:active)
    params.require(:text).permit(:active)
  end
end
