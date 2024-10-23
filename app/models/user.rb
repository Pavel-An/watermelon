class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :project_members
  has_many :projects, through: :project_members

  validates :email, presence: true, uniqueness: true
  validates :admin, inclusion: [true, false]
end
