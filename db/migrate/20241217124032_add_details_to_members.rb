class AddDetailsToMembers < ActiveRecord::Migration[7.2]
  def change
    add_column :members, :role, :bigint, null: false, default: 0
    add_column :members, :invited_id, :bigint, null: false
    add_column :members, :last_activity, :datetime
    add_foreign_key :members, :users, column: :invited_id, primary_key: :id
  end
end
