class User < ApplicationRecord
  has_one :user_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  
  enum role: { regular: 'Regular', admin: 'Admin' }
  validates :username, presence: true, uniqueness: true

  # ...
end
