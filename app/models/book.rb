class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher
  has_many :reviews
  has_many :comments
  has_many :likes
  has_many :ratings
  has_many :requests
  has_many :specifications, dependent: :destroy, inverse_of: :book
  validate :validate_number_specifications
  accepts_nested_attributes_for :specifications,
    reject_if: proc {|attributes| attributes[:feature_type].blank?},
    allow_destroy: true

  private
  def validate_number_specifications
    if self.specifications.size < Settings.specifications.minimum_item ||
      self.specifications.size > Settings.specifications.maximum_item
      errors.add :book, I18n.t(".number_specifications_errors")
    end
  end
end
