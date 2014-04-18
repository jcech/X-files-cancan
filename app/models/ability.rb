class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roles.name == "Director"
      can :manage, :all
    elsif user.roles.name == "Operative"
      can :read, Document
    elsif user.roles.name.nil?
      cannot [:read, :create], Document
    end
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true

  end
end
