class Member < ApplicationRecord
  enum role: { member: 0, administrator: 1, owner: 2 }

  belongs_to :project
  belongs_to :user
  belongs_to :invited, class_name: "User"
  has_many :permissions
  has_one :access_to_member
  has_one :access_to_all_document
  has_one :access_to_document
  has_one :access_to_project

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

  def permissions?
    permissions.exists?
  end

  def update_to_project_owner
    permissions.each do |access|
      if access.type == "AccessToProject"
        attribute_values = { edit: true, erase: true }
      elsif access.type == "AccessToMember"
        attribute_values = { create: true, view: true, edit: true, erase: true }
      else
        attribute_values = { create: true, view: true, edit: true, erase: true }
      end

      access.update(attribute_values)
    end
  end

  def update_to_project_administrator
    permissions.each do |access|
      if access.type == "AccessToProject"
        attribute_values = { edit: true, erase: false }
      elsif access.type == "AccessToMember"
        attribute_values = { create: true, view: true, edit: true, erase: true }
      else
        attribute_values = { create: false, view: false, edit: false, erase: false }
      end

      access.update(attribute_values)
    end
  end

  def update_to_project_member
    permissions.each do |access|
      if access.type == "AccessToProject"
        attribute_values = { edit: false, erase: false }
      elsif access.type == "AccessToMember"
        attribute_values = { create: false, view: true, edit: false, erase: false }
      else
        attribute_values = { create: false, view: false, edit: false, erase: false }
      end

      access.update(attribute_values)
    end
  end
end
