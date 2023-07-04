class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          # ...
        
          enum role: { regular: 'Regular', admin: 'Admin' }
          validates :username, presence: true, uniqueness: true
        
          # ...
      
        
end
