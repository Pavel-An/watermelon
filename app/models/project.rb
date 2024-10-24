class Project < ApplicationRecord
  enum status: { active: 1, close: 2, paused: 3, archived: 4 }

  validates :name, presence: true, length: { maximum: 100 }
  validates :status, presence: true

  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
end
