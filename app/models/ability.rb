class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Project, members: { user: user } 
    can :update, Project, members: { user: user, role: ["administrator", "owner" ] }
    can :destroy, Project, members: { user: user, role: "owner" }

    Rails.logger.info "Member: #{@project}"
    # can :show, Project, members if Member.find_by(user_id: user.id).has_action?(:members, :view)


    return unless user.manager? || user.admin?

    can :create, Project

    return unless user.admin?

    can :access, :rails_admin 
    can :manage, :all
  end
end
