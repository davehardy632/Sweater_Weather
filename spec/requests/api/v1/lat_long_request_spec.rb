require 'rails_helper'

describe "Forecast and location Api" do
  it "returns latitude and longitude from a given city and state" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    lat_long = JSON.parse(response.body)

    expect(lat_long["data"].keys).to eq(["id", "type", "attributes"])
    expect(lat_long["data"]["attributes"].keys).to eq(["location", "latitude", "longitude"])
    expect(lat_long["data"]["attributes"]["location"]).to eq("Denver Colorado")
  end
end
