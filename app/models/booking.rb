class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :requesting_user, foreign_key: 'requesting_user_id', class_name: "User"
  has_one :order

  # attributes and place values
  enum status: {declined: 0, pending: 1, approved: 2}

  # validations
  validates :no_of_days, presence: true, length: {in: 1..30}
  validates :start_date, presence: true
  validates :must_be_in_the_future

  def must_be_in_the_future
    if start_date < Date.tomorrow
      error.add(:start_date, "must be from the day after current date")
    end
  end
end
