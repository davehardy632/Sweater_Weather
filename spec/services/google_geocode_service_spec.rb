require 'rails_helper'

describe GoogleGeocodeService do

  describe "coordinates" do
    it "finds latitude and longitude coordinated for a given city" do


      service = GoogleGeocodeService.new
      coordinates = service.return_coordinates("denver,co")

      expect(coordinates.latitude).to eq(39.7392358)
      expect(coordinates.longitude).to eq(-104.990251)
      expect(coordinates.location).to eq("Denver Colorado")
    end
  end
end
