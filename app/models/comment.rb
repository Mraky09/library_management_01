class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  delegate :name, to: :user, prefix: true
end
