class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,7}\z/i

  validates :email, presence: true,
            uniqueness: true,
            format: {with: email_regex}
  validates :password, presence: true,
            confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password_confirmation
  
end
