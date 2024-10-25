class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string  :name, null: false, limit: 100
      t.text    :description
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
