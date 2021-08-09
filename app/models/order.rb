class Order < ApplicationRecord
  belongs_to :booking

  # validation
  validates :receipt_url, presence: true
  validates :payment_id, presence: true
end
