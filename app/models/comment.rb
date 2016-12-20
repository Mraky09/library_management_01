class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  belongs_to :book
end
