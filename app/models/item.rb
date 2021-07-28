class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum condition: {distressed: 0, good: 1, excellent: 2, unworn: 3}

  before_save :remove_whitespace
  before_save :convert_prices_to_cents


  private
  def remove_whitespace
    self.name = self.name.strip
    self.description = self.description.strip
  end

  def convert_prices_to_cents
    self.price_per_day = (self.attributes_before_type_cast["price_per_day"].to.f * 100).round
    self.deposit = (self.attributes_before_type_cast["deposit"].to.f * 100).round
  end

end
