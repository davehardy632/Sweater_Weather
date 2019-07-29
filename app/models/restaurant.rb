class Restaurant

  attr_reader :name, :address
  def initialize(restaurant_data)
    @name = restaurant_data[:name]
    @address = restaurant_data[:location][:address1]
  end
end
