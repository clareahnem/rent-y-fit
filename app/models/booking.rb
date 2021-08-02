class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :requesting_user, foreign_key: 'requesting_user_id', class_name: "User"
  has_one :order
end
