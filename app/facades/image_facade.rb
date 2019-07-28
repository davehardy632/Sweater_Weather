require 'json'
require 'active_support/core_ext'

class ImageFacade

  attr_reader :id,
              :url

  def initialize(city_state)
    @id = "flickr image"
    @city_state = city_state
  end

  def url
    response = flickr_api_service.return_image_background(city_state)
    farm_id = response[:rsp][:photos][:photo][:farm]
    server_id = response[:rsp][:photos][:photo][:server]
    id = response[:rsp][:photos][:photo][:id]
    secret = response[:rsp][:photos][:photo][:secret]

    "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end

  private

  attr_reader :city_state

  def flickr_api_service
    FlickrApiService.new
  end


end
