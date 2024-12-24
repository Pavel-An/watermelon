class Member < ApplicationRecord
  enum role: { member: 0, administrator: 1, owner: 2 }

  belongs_to :project
  belongs_to :user
  belongs_to :invited, class_name: "User"
  has_one :member_permission, dependent: :destroy

  validates :project_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
  validates :project_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :project_id }

  def name
    user.full_name
  end

  def login
    user.email
  end

  def current_user?(object)
    user == object
  end

  def has_action?(scope, action)
    permissions_role = MemberRolePermission.find_by(name: role).permissions
    permissions_member = member_permission.permissions
    permissions = permissions_role.merge(permissions_member){ |key, old, new| old.union(new)}

    if permissions.include?(scope.to_s)
      permissions[scope.to_s].include?(action.to_s)
    else 
      false
    end
  end
end
