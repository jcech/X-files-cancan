class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roles.first.nil?
      cannot :all, Document
    elsif user.roles.first.security_access == 1
      can :create, Document
      cannot :read, Document, :security_level == 2
      can :update, Document, :user_id == user.id
    elsif user.roles.first.security_access == 2
      can :manage, :all

    end
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
  end

end
