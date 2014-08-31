class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,4}/, on: :create
  validates :password, presence: true
  # validates_presence_of :password_confirmation
  # validates_confirmation_of :password, message: "Password should match confirmation"
  # validates :password, with: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$}/, on: :create

  has_many :cheatsheets
  has_many :snippets
end
