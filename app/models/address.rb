class Address < ApplicationRecord
  belongs_to :user

  #validations
  validates :street_no, presence: true
  validates :street, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true, length: { is: 4 }, format: { with: /3\d{3}/,
    message: "error: RENT-Y-FiT is currently only available in Victoria AUSTRALIA" }
end
