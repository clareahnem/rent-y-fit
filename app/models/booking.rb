class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :requesting_user, foreign_key: 'requesting_user_id', class_name: "User"
  has_one :order

  # attributes and place values
  enum status: {declined: 0, pending: 1, approved: 2}

  # validations
  validates :no_of_days, presence: true, length: {in: 1..30}
  validates :start_date, presence: true, timeliness: {after: lambda { Date.current }, type: :date}

  
end
