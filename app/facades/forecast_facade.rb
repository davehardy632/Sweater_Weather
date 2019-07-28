class ForecastFacade

  def forecast_data_by_city(city_state)
    DarkSkyApiService.new(google_geocode_service.return_coordinates(city_state))
    binding.pry
  end


  def google_geocode_service
    GoogleGeocodeService.new
  end
end
