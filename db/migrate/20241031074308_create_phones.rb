class CreatePhones < ActiveRecord::Migration[7.2]
  def change
    create_table :phones do |t|
      t.references :user, null: false, foreign_key: true
      t.string :number, null: false

      t.timestamps
    end
  end
end
