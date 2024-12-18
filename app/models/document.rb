class Document < ApplicationRecord
  enum status: { draft: 0, created: 1 }

  belongs_to :user
  belongs_to :project
  has_many :document_blocks, -> { order(position: :asc) }
  has_rich_text :description
  accepts_nested_attributes_for :document_blocks, allow_destroy: true

  def document_block_headers
    document_blocks.where(block_type: ["h1", "h2", "h3"])
  end
end
