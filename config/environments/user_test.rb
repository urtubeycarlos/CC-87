class Message
  def initialize(message="")
    @message = message
    
  end

  def full_message
    "#{"said:"} #{@message}"
  end
end