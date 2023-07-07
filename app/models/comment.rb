class Comment < ApplicationRecord
  belongs_to :article, dependent: :destroy
  belongs_to :user
end
