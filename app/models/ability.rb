class Ability
  include CanCan::Ability

  def initialize(user)
    # Define User abilities
    if user.is? :admin
      can :manage, User
    else
      can :read, User
    end
  end
end
