class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_date, presence: true
  validates :end_date, presence: true, if: :end_date_must_greater_than_start_date?
  validate :check_book_available

  enum status:  [:waiting, :accepted, :rejected]

  scope :user_request, -> (current_user) {where(user: current_user)}

  private

  def check_book_available
    temp_request = Request.find_by book_id: self.book_id, status: :accepted
    unless temp_request.present? && self.start_date > temp_request.end_date
      errors.add :request, (I18n.t(".book_are_borrowed") + self.user.name + " " +
        temp_request.start_date.to_date.to_s + " " + temp_request.end_date.to_date.to_s)
    end
  end

  def end_date_must_greater_than_start_date?
    self.start_date < self.end_date
  end
end
