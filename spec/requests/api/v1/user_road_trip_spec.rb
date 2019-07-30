require 'rails_helper'

describe "User enters origin and destination" do
  it "returns the trip length and weather forcast upon arrival" do

    user = User.create(email: "whatever@gmail.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")

    post '/api/v1/road_trip' :params => {
                                "origin": "Denver,CO",
                                "destination": "Pueblo,CO",
                                "api_key": "jgn983hy48thw9begh98h4539h4"
                              }

    expect(response).to be be_successful
    response = JSON.parse(response.body)

    expect(response.count).to eq(3)
  end
end
