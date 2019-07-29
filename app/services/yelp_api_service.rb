class YelpApiService

  attr_reader :food_type, :finish, :trip_duration, :trip_duration_in_seconds, :duration
  def initialize(food_type, finish, seconds, format)
    @food_type = food_type
    @finish = finish
    @trip_duration = format
    @trip_duration_in_seconds = seconds
  end

  def return_cuisines_and_hours
    parsed_response(conn.get)
  end

  def duration_to_unix
    time = Time.now + trip_duration_in_seconds
    unix_time = time.to_i
  end


  def conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=restaurants&location=#{finish}&categories=#{food_type}&open_at=#{duration_to_unix}") do |f|
      f.headers["Authorization"] = ENV["Yelp_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end


end
