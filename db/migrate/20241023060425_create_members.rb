class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :members, [ :project_id, :user_id ], unique: true
  end
end
