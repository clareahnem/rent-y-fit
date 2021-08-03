class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :requesting_user, foreign_key: 'requesting_user_id', class_name: "User"
  has_one :order

  # attributes and place values
  enum status: {declined: 0, pending: 1, approved: 2}

  # validations
  validates :status, presence: true
  validates :no_of_days, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 30}
  validates :start_date, presence: true, timeliness: {after: :today, type: :date}
  
end
