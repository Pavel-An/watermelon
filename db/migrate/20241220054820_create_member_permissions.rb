class CreateMemberPermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :member_permissions do |t|
      t.references :member, null: false, foreign_key: true
      t.jsonb :permissions, null: false, default: {}

      t.timestamps
    end
  end
end
