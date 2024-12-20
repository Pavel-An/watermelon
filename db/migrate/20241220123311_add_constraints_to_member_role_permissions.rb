class AddConstraintsToMemberRolePermissions < ActiveRecord::Migration[7.2]
  def change
    add_column :member_role_permissions, :constraints, :jsonb, null: false, default: {}
  end
end
