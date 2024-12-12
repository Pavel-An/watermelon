class Member < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
  validates :project_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :project_id }


  def name
    user.full_name
  end

  def login
    user.email
  end
end
