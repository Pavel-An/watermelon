class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :recoverable
  devise :database_authenticatable, :registerable, :confirmable,
         :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  enum role: { user: 0, admin: 1 }

  has_many :members
  has_many :projects, through: :members

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true


  def self.from_google(u)
    create_with(uid: u[:uid], provider: 'google',
                password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end
end
