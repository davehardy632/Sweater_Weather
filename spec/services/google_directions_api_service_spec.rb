require 'rails_helper'

describe GoogleDirectionsApiService do

  describe "trip information" do
    it "finds trip information" do
      start = "denver,co"
      finish = "pueblo,co"
      trip = GoogleDirectionsApiService.new(start, finish)
      trip_data = trip.return_trip


      expect(trip_data[:routes].first[:legs].first[:duration][:text]).to eq("1 hour 47 mins")
      expect(trip_data[:routes].first[:legs].first[:duration][:value]).to eq(6413)
      expect(trip_data[:routes].first[:legs].first[:end_address]).to eq("Pueblo, CO, USA")
    end
  end
end
