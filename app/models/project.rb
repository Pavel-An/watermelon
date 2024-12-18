class Project < ApplicationRecord
  enum status: { open: 0, close: 1, paused: 2, archived: 3 }

  validates :name, presence: true, length: { maximum: 100 }
  validates :status, presence: true

  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :documents
  has_rich_text :description

  def member?(user)
    !self.members.find_by(user_id: user.id).blank?
  end

  def member(user)
    self.members.find_by(user_id: user.id)
  end
end
