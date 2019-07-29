require 'rails_helper'

describe YelpApiService do

  describe "restaurants open at location at a specific time" do
    it "finds restaurant info related to the trip length" do


      food_type = "chinese"
      finish = "pueblo,co"
      seconds = 6413
      format = "1 hour 47 mins"

      yelp_service = YelpApiService.new(food_type, finish, seconds, format)
      yelp_response = yelp_service.return_cuisines_and_hours

      expect(yelp_response[:businesses].first[:name]).to eq("Kan's Kitchen")\
    end
  end
end
