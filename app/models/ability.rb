class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roles.first.nil?
      cannot :all, Document
    elsif user.roles.first.name == "Director"
      can :manage, :all
    elsif user.roles.first.name == "Operative"
      can :read, Document
    end
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
  end

end
