require 'rails_helper'

describe "User enters origin and destination" do
  before :each do
  WebMock.allow_net_connect!
  User.create(email: "whatever@gmail.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
  end
  it "returns the trip length and weather forcast upon arrival" do


    post '/api/v1/road_trip', :params => {
                                "origin": "Denver,CO",
                                "destination": "Pueblo,CO",
                                "api_key": "jgn983hy48thw9begh98h4539h4"
                              }

    expect(response).to be_successful

    future_forecast = JSON.parse(response.body)

    expect(future_forecast["data"]["attributes"].keys).to eq(["id", "temperature", "summary", "estimated_travel_time"])
  end
end
