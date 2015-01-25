class Ability
  include CanCan::Ability

  def initialize(user)
    if user.email != "Guest"
      can [:index, :read, :create], Post
      can [:edit, :update, :destroy], Post, user_id: user.id
      can [:index, :read], User
      can [:update, :delete], User, id: user.id
      can :read, :all
    else
      can :index, Post
      can :read, :all
    end
  end
end
