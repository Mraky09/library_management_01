class Category < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: {maximum: 255}, uniqueness:
    {case_sensitive: false}
  scope :search, -> (condition) {where("name LIKE :search OR description LIKE :search",
    search: "%#{condition}%")}
end
