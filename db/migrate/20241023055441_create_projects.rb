class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string  :name
      t.text    :description
      t.integer :status

      t.timestamps
    end
  end
end
