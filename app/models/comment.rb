class Comment < ApplicationRecord
  belongs_to :post
  validates :username, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 3}
end
