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