class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher
  has_many :reviews
  has_many :comments
  has_many :likes
  has_many :ratings
  has_many :requests
end
