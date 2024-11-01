class CreateUserDepartments < ActiveRecord::Migration[7.2]
  def change
    create_table :user_departments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
