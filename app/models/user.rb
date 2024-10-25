class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  enum role: { user: 0, admin: 1 }

  has_many :members
  has_many :projects, through: :members

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
