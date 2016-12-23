class Author < ApplicationRecord
  has_many :books
  scope :search, -> (condition) {where("name LIKE :search OR description LIKE :search",
    search: "%#{condition}%")}
  mount_uploader :image, PictureUploader
end
