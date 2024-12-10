class AdminAbility
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :manage, :all           # allow access to dashboard
    end
  end
end
