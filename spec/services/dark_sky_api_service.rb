require 'rails_helper'

describe DarkSkyApiService do

  describe "coordinates" do
    xit "finds latitude and longitude coordinated for a given city" do

      # VCR.use_cassette("services/return_forecast_data") do
        # service = DarkSkyApiService.new()
        coordinates = service.return_coordinates("denver,co")

        expect(coordinates.latitude).to eq(39.7392358)
        expect(coordinates.longitude).to eq(-104.990251)
        expect(coordinates.location).to eq("Denver Colorado")
      # end
    end
  end
end
