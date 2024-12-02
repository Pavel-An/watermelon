class CreateDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.bigint :status, default: 0

      t.timestamps
    end
  end
end
