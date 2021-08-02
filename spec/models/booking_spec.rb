require 'rails_helper'

RSpec.describe Booking, type: :model do
  context "validations" do
    it "is not valid without an item" do
      booking = build(:booking, item: nil)
      expect(booking).to_not be_valid
    end

    it "is not valid without a requesting user" do
      booking = build(:booking, requesting_user_id: nil)
      expect(booking).to_not be_valid
    end

    it "is not valid without a booking status" do
      booking = build(:booking, status: nil)
      expect(booking).to_not be_valid
    end

    it "is not valid without no_of_days" do
      booking = build(:booking, no_of_days: nil)
      expect(booking).to_not be_valid
    end

    it "is not valid if no_of_days is under 1" do
      booking = build(:booking, no_of_days: 0)
      expect(booking).to_not be_valid
    end

    it "is not valid if no_of_days exceeds 30" do
      booking = build(:booking, no_of_days: 31)
      expect(booking).to_not be_valid
    end

    it "is not valid without a start date" do
      booking = build(:booking, start_date: nil)
      expect(booking).to_not be_valid
    end

    it "is not valid if start_date is before current date" do
      booking = build(:booking, start_date: "2021-07-30")
      expect(booking).to_not be_valid
    end
  end
end
