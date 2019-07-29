class TripRestaurantsController < ApplicationController

  def index
    render json: TripRestaurantSerializer.new(TripRestaurantFacade.new(trip_restaurant_params))
  end

  private

  def trip_restaurant_params
    params.permit("start", "end", "food")
  end


end
