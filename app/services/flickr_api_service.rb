require 'json'
require 'active_support/core_ext'
# Hash.from_xml('<variable type="product_code">5</variable>').to_json

class FlickrApiService

  def return_image_background(city_state)
    parsed_response(conn.get("?method=flickr.photos.search&name=value&tags=#{city_state},downtown,skyline&tag_mode=all&per_page=1"))
  end


  def conn
    Faraday.new(url: 'https://www.flickr.com/services/rest/') do |f|
      f.adapter Faraday.default_adapter
      f.params["api_key"] = ENV['Flikr_API_KEY']

    end
  end

  def parsed_response(response)
    JSON.parse(Hash.from_xml(response.body).to_json, symbolize_names: true)
  end

end
