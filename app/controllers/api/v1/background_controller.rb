class Api::V1::BackgroundController < ApplicationController

  def show
    render json: ImageSerializer.new(ImageFacade.new(image_params["location"]))
  end

  private

  def image_params
    params.permit(:location)
  end


end
