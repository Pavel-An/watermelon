class Permission < ApplicationRecord
  belongs_to :member

  def self.create_all(member)
    Permission.subclasses.each do |type|
      type.create(member_id: member.id)
    end
  end
end
