class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         
  enum role: [ :user, :agent, :admin ]

  has_many :tickets

  validates :email, :password, presence: true
  validates :email, :uniqueness => { case_sensitive: false }
end
