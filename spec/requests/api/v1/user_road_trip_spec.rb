require 'rails_helper'

describe "User enters origin and destination" do
  before :each do
    json_forecast_response = File.open("./fixtures/dark_sky_future_forecast.json")

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV["Dark_Sky_API_KEY"]}/38.2542053,-104.6087488,#{Time.now.to_i + 6413}?exclude=hourly,daily").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v0.15.4'
          }).
        to_return(status: 200, body: json_forecast_response, headers: {})

    json_directions_response = File.open("./fixtures/denver_to_pueblo_google_directions.json")

    stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json?origin=Denver,CO&destination=Pueblo,CO&outputFormat=json&mode=driving&key=#{ENV["Google_Geocode_API_KEY"]}").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v0.15.4'
          }).
        to_return(status: 200, body: json_directions_response, headers: {})

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

  it "if the wrong api is given the user is given a 401 status of unauthorized" do

    post '/api/v1/road_trip', :params => {
                                "origin": "Denver,CO",
                                "destination": "Pueblo,CO",
                                "api_key": "jgn483hy48thw9bedh98egcvdr4"
                              }
    error_message = JSON.parse(response.body)
    expect(error_message).to eq({"error"=>"Incorrect Api Key", "status"=>401})
    expect(response.status).to eq(401)
  end
end
