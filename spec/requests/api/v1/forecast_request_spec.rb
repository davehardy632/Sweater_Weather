require 'rails_helper'

describe "Forecast and location Api" do
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

    xml_url_flickr_response = File.open("./fixtures/flickr_api_url.xml")

    stub_request(:get, "https://www.flickr.com/services/rest/?api_key=#{ENV["Flikr_API_KEY"]}&method=flickr.photos.search&name=value&per_page=1&tag_mode=all&tags=denver,co,downtown,skyline").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v0.15.4'
        }).
        to_return(status: 200, body: xml_url_flickr_response , headers: {})
  end
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
end
