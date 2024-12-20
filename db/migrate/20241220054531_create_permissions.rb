class CreatePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.references :type_permission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
