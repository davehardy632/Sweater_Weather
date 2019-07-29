require 'rails_helper'

describe "Forecast and location Api" do
#   it "returns latitude and longitude from a given city and state" do
#
#     get '/api/v1/forecast?location=denver,co'
#
#     expect(response).to be_successful
#
#     lat_long = JSON.parse(response.body)
# binding.pry
#     expect(lat_long["data"].keys).to eq(["id", "type", "attributes"])
#     expect(lat_long["data"]["attributes"].keys).to eq(["location", "latitude", "longitude"])
#     expect(lat_long["data"]["attributes"]["location"]).to eq("Denver Colorado")
#   end

  it "returns forecast data from the returned latitude and longitude from above" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    weather_data = JSON.parse(response.body)

    current_forecast_data = weather_data["data"]["attributes"]["current_forecast"]["data"]["attributes"]

    expected_keys = ["id", "timezone", "time", "summary", "icon", "precipitation_probablility", "temperature", "feels_like_temperature", "humidity", "uv_index", "visibility"]

    expect(current_forecast_data.keys).to eq(expected_keys)
  end

  it "the url returns an image of the city entered in the parameters" do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    flickr_image = JSON.parse(response.body)

    expect(flickr_image["data"]["attributes"].keys).to eq(["id", "url"])
  end

  # it "returns yelp json response when making a request" do
  #
  #   get '/api/v1/yelp?city_to_coordinates=denver,co'
  #
  #   expect()

  # end
end
