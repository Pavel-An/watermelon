class TypePermission < ApplicationRecord
  has_many :permissions
  acts_as_list
end
