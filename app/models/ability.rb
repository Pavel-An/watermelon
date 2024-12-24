class Ability
  include CanCan::Ability

  def initialize(user,  member = nil )
    return unless user.present?

    can :read, Project, members: { user: user} 
    can :update, Project, members: { user: user, role: ["administrator", "owner" ] }
    can :destroy, Project, members: { user: user, role: "owner" }

    Rails.logger.debug "START MEMBER_DEBUG: #{member}"
    if member
      can :read, Member if member.has_action?(:members, :view)
      can :create, Member if member.has_action?(:members, :create)
      can :update, Member if member.has_action?(:members, :update)
      can :destroy, Member if member.has_action?(:members, :destroy)
    end
    Rails.logger.debug "STOP MEMBER_DEBUG: #{member}"
   

    return unless user.manager? || user.admin?

    can :create, Project

    return unless user.admin?

    can :access, :rails_admin 
    can :manage, :all
  end
end
