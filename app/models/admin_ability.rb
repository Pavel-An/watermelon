class AdminAbility
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard                      # allow access to dashboard
    end
  end
end
