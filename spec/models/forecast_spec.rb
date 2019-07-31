require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe "validations" do
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
    it {should validate_presence_of :data}
  end
end
