class UserProfile < ApplicationRecord
  belongs_to :user

  def role
    user.admin? ? 'Admin' : 'Regular'
  end

  def post_count
    user.articles.count
  end
end
