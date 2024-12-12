class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end


    can :read, Project
    if user.admin?
      can :access, :rails_admin 
      can :manage, :all     
    else
      can :read, Project
    end

  end
end
