class Project < ApplicationRecord
  enum status: { active: 1, close: 2, archived: 3 }

  validates :name, presence: true, length: { maximum: 100 }
  validates :status, presence: true

  has_many :project_members
  has_many :users, through: :project_members
end
