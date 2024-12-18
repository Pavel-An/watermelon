class Member < ApplicationRecord
  enum role: { member: 0, manager: 1, owner: 2 }

  belongs_to :project
  belongs_to :user
  belongs_to :invited, class_name: "User"

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

  def current_user?(object)
    user == object
  end
end
