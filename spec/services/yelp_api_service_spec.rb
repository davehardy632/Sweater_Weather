require 'rails_helper'

describe YelpApiService do

  describe "restaurants open at location at a specific time" do
    it "finds restaurant info related to the trip length" do


       binding.pry
      food_type = "chinese"
      finish = "pueblo,co"
      # trip_object = Trip.new(duration: )

      yelp_service = YelpApiService.new(food_type, finish, trip_object)
      yelp_response = yelp_service.return_cuisines_and_hours

      binding.pry

      expect(trip_data[:routes].first[:legs].first[:duration][:text]).to eq("1 hour 47 mins")

    end
  end
end
