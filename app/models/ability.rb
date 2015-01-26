class Ability
  include CanCan::Ability

  def initialize(user)
    if user.email != "Guest"
      can :create, Post
      can [:update, :destroy], Post, user_id: user.id
      can [:update, :destroy], User, id: user.id
      can [:create, :update, :destroy], Tag
      can :read, :all
    else
      can :index, Post
      can :read, :all
    end
  end
end
