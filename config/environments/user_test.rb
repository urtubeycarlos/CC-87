class User
  def initialize(name="", lastname="")
    @name = name
    @lastname = lastname
  end

  def full_name
    "#{@name} #{@lastname}"
  end
end