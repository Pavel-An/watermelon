class Document < ApplicationRecord
  enum status: { draft: 0, created: 1 }

  belongs_to :user
  belongs_to :project
  has_many :document_blocks
  has_rich_text :description
  accepts_nested_attributes_for :document_blocks, allow_destroy: true
end
