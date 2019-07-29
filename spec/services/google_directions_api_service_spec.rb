require 'rails_helper'

describe GoogleDirectionsApiService do

  describe "members" do
    it "finds trip information" do
      VCR.use_cassette("services/returns_trip_data") do
        start = "denver,co"
        finish = "pueblo,co"
        members = GoogleDirectionsApiService.new(start, finish)
        .find_house_members("CO")
        member = members.first

        expect(members.count).to eq(7)
        expect(member[:name]).to eq("Diana DeGette")
        expect(member[:party]).to eq("D")
        expect(member[:district]).to eq("1")
      end
    end
  end
end
