class Item < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :category
  has_many :items_brands
  has_many :brands, through: :items_brands
  has_many :bookings
  has_many :orders, through: :bookings

  # attributes and place values
  enum condition: {distressed: 0, good: 1, excellent: 2, unworn: 3}
  has_one_attached :picture
  accepts_nested_attributes_for :items_brands
  accepts_nested_attributes_for :brands

  
  # private methods
  before_save :remove_whitespace
  before_save :convert_prices_to_cents

  # data validations
  validates :name, presence: true
  validates :price_per_day, presence: true


  private
  def remove_whitespace
    self.name = self.name.strip
    self.description = self.description.strip
  end

  def convert_prices_to_cents
    self.price_per_day = (self.attributes_before_type_cast["price_per_day"].to_f * 100).round
    self.deposit = (self.attributes_before_type_cast["deposit"].to_f * 100).round
  end

  # adds new brand if user inputs new brand name 
  def brands_attributes=(brand_attributes)
    # because params are passed as a hash we use .values.each
    brands_attributes.values.each do |brand_attribute|
      brand = Brand.find_or_create_by(brand_attribute)
      self.brands << brand
    end
  end
end
