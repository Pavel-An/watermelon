class CreateMemberRolePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :member_role_permissions do |t|
      t.string :name
      t.jsonb :permissions, null: false, default: {}

      t.timestamps
    end
  end
end
