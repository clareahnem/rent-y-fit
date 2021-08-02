RSpec.describe "Address Factory" do
    it "is valid" do 
        expect(build(:address)).to be_valid
    end

    context "testing properties" do
        before(:all) do
        @user = build(:address)
        end

        it "has the correct street no" do
            expect(@user.street_no).to eq "123"
        end

        it "has the correct street name" do
            expect(@user.street).to eq "Sesame Street"
        end

        it "has the correct suburb" do
            expect(@user.suburb).to eq "Melbourne"
        end

        it "has the correct postcode" do
            expect(@user.postcode).to eq "3000"
        end
    end

end

RSpec.describe "Item Factory" do
    it "is valid" do 
        expect(build(:item)).to be_valid
    end

    context "testing properties" do
        before(:all) do
        @item = build(:item)
        end

        it "has the correct item name" do
            expect(@item.name).to eq "Red Bucket Hat"
        end

        it "has the correct description" do
            expect(@item.description).to eq "description"
        end

        it "should be available" do
            expect(@item.availability).to eq true
        end

        it "should have the correct deposit" do
            expect(@item.deposit).to eq 10000
        end

        it "should have the correct price per day" do
            expect(@item.price_per_day).to eq 1000
        end
    end

end

RSpec.describe "Booking Factory" do
    it "is valid" do 
        expect(build(:booking)).to be_valid
    end

    context "testing properties" do
        before(:all) do
        @booking = build(:booking)
        end

        it "has the correct booking status" do
            expect(@booking.status).to eq "pending"
        end

        it "has the correct no_of_days" do
            expect(@booking.no_of_days).to eq 5
        end

        it "should have the start date as a date" do
            expect(@booking.start_date).to be_a Date
        end
    end
end

RSpec.describe "Order Factory" do
    it "is valid" do 
        expect(build(:order)).to be_valid
    end

    context "testing properties" do
        before(:all) do
        @order = build(:order)
        end

        it "has the correct receipt_url" do
            expect(@order.receipt_url).to eq "receipt"
        end

        it "has the correct payment_id" do
            expect(@order.payment_id).to eq "payment"
        end
    end
end