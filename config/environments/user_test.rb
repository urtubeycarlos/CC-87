class Message
  def initialize(message="")
    @message = message
    
  end

  def full_message
    "#{"Said:"} #{@message}"
  end
end