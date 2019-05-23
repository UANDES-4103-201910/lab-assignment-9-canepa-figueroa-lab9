class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_tickets
  has_many :tickets, :through => :user_tickets
  #validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

  # validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
  # validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/, message: "assword must be between 8 to 12 alphanumeric characters"}

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end


end
