class DocumentBlock < ApplicationRecord
  belongs_to :document
  has_rich_text :reach_content
  acts_as_list scope: :document

  validates :position, uniqueness: { scope: :document }
end
