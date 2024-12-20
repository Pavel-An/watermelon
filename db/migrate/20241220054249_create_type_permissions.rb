class CreateTypePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :type_permissions do |t|
      t.string :name
      t.bigint :position, default: 0, null: false, index: true

      t.timestamps
    end
  end
end
