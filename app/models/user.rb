class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :recoverable
  devise :database_authenticatable, :registerable, :confirmable,
         :validatable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  enum role: { user: 0, admin: 1 }

  has_one :user_position
  has_one :position, through: :user_position
  has_one :user_department
  has_one :department, through: :user_department
  has_many :phones
  has_many :members
  has_many :projects, through: :members
  has_one_attached :avatar
  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :user_position, allow_destroy: true
 

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true


  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end
end
