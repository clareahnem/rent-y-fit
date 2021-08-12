require 'rails_helper'

RSpec.describe Address, type: :model do

  context "validations" do
    it "is not valid without a user" do
      address = build(:address, user_id: nil)
      expect(address).to_not be_valid
    end

    it 'is not valid without a street number' do
      address = build(:address, street_no: nil)
      expect(address).to_not be_valid
    end

    it 'is not valid without a street name' do
      address = build(:address, street: nil)
      expect(address).to_not be_valid
    end

    it 'is not valid without a suburb' do
      address = build(:address, suburb: nil)
      expect(address).to_not be_valid
    end

    it "is not valid outside of victoria" do
      address = build(:address, postcode: "4000")
      expect(address).to_not be_valid
    end
  end
end
