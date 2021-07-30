require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it "is not valid without a user" do
      item = build(:item, user_id: nil)
      expect(item).to_not be_valid
    end

    it "is not valid without a name" do
      item = build(:item, name: nil)
      expect(item).to_not be_valid
    end

    it "is not valid without a price_per_day" do
      item = build(:item, price_per_day: nil)
      expect(item).to_not be_valid
    end
  end
end
