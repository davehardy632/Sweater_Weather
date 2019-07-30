require 'rails_helper'

describe FlickrApiService do
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
  describe "Flickr api calls" do
    it "flickr api call returns data to build a url" do

      flickr_api = FlickrApiService.new

      facade = ImageFacade.new("denver,co")

      api_response = flickr_api.return_image_background("denver,co")

      expect(api_response[:rsp][:photos][:photo][:secret]).to eq("532368e033")
      expect(api_response[:rsp][:photos][:photo][:id]).to eq("39910698973")
      expect(api_response[:rsp][:photos][:photo][:farm]).to eq("5")
      expect(api_response[:rsp][:photos][:photo][:server]).to eq("4912")
      expect(facade.url).to eq("https://farm5.staticflickr.com/4912/39910698973_532368e033.jpg")
    end
  end
end
