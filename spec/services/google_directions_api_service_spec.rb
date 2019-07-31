require 'rails_helper'

describe GoogleDirectionsApiService do
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
  end

  it "returns trip information from a given origin and destination" do
    origin = "Denver,CO"
    destination = "Pueblo,CO"

    service = GoogleDirectionsApiService.new(origin, destination)

    result = service.return_trip

    expect(result[:routes].first[:legs].first[:duration][:text]).to eq("1 hour 47 mins")
    expect(result[:routes].first[:legs].first[:duration][:value]).to eq(6413)
    expect(result[:routes].first[:legs].first[:end_location][:lat]).to eq(38.2542053)
    expect(result[:routes].first[:legs].first[:end_location][:lng]).to eq(-104.6087488)
  end
end
