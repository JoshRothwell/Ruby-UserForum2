class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: %w[public private archived] }
end

class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  belongs_to :user
end
