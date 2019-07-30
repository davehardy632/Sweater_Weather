require 'rails_helper'

describe DarkSkyApiService do
  before :each do
    json_forecast_response = File.open("./fixtures/dark_sky_forecast_data.json")

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["Dark_Sky_API_KEY"]}/39.7392358,-104.990251?exclude=minutely,alerts,flags").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v0.15.4'
          }).
        to_return(status: 200, body: json_forecast_response, headers: {})

    json_coordinate_response = File.open("./fixtures/coordinate_data.json")

    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["Google_Geocode_API_KEY"]}").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v0.15.4'
        }).
        to_return(status: 200, body: json_coordinate_response, headers: {})
  end
  describe "coordinates" do
    it "finds latitude and longitude coordinated for a given city" do
      latitude = 39.7392358
      longitude = -104.990251
      dark_sky_api = DarkSkyApiService.new(latitude, longitude)

      parsed_weather_data = dark_sky_api.parse_weather_data

      expect(parsed_weather_data.keys).to eq([:latitude, :longitude, :timezone, :currently, :hourly, :daily, :offset])
      expect(parsed_weather_data[:latitude]).to eq(latitude)
      expect(parsed_weather_data[:longitude]).to eq(longitude)
      expect(parsed_weather_data[:timezone]).to eq("America/Denver")
    end
  end
end
