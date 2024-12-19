class CreatePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :permissions do |t|
      t.references :member, null: false, foreign_key: true
      t.boolean :create, null: false, default: false
      t.boolean :view, null: false, default: false
      t.boolean :edit, null: false, default: false
      t.boolean :erase, null: false, default: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
