class Forecast < ApplicationRecord
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :data

end
