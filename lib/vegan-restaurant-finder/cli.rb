class VeganRestaurantFinder::CLI

  attr_accessor :location

  def call
    get_location
  end

  def get_location(location)

  end

  def list_restaurants
    puts "************* The Following Restaurants in your area are Vegan! *************"


    puts ""
    puts "restaurant.name"

    puts ""
    puts "restaurant.summary"
    puts ""
  end
end