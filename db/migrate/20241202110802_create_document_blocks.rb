class CreateDocumentBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :document_blocks do |t|
      t.references :document, null: false, foreign_key: true
      t.string :block_type
      t.text :content
      t.bigint :position

      t.timestamps
    end
  end
end
