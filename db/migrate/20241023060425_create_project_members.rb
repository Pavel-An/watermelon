class CreateProjectMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :project_members, id: false do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :permissions

      t.timestamps
    end
    add_index :project_members, [ :project_id, :user_id ], unique: true
  end
end
