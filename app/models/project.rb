class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description
  validates :status, numericality: { only_integer: true}

  has_many :project_members
  has_many :users, through: :project_members

  enum status: { active: 1, archived: 2 }
end
