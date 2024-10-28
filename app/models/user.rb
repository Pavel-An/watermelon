class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :recoverable
  devise :database_authenticatable, :registerable, :confirmable,
         :validatable

  enum role: { user: 0, admin: 1 }

  has_many :members
  has_many :projects, through: :members

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
