require 'rails_helper'

describe "Forecast and location Api" do
  xit "returns latitude and longitude from a given city and state" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    lat_long = JSON.parse(response.body)

    expect(lat_long["data"].keys).to eq(["id", "type", "attributes"])
    expect(lat_long["data"]["attributes"].keys).to eq(["location", "latitude", "longitude"])
    expect(lat_long["data"]["attributes"]["location"]).to eq("Denver Colorado")
  end

  it "returns forecast data from the returned latitude and longitude from above" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    weather_data = JSON.parse(response.body)
binding.pry
    expect(weather_data["data"].count).to eq(3)
  end
end
