class VeganRestaurantFinder::CLI

  attr_accessor :location, :name

  def call
    puts "Welcome to Vegan Restaurant Finder!"
    @location = ""
    get_location
  end

  def get_location(location)
    until location == "exit"
      puts "Please enter your zip code. We will list your local vegan restaurants within a 15 mile radius!"
      puts "Type in 'exit' to exit this program."
      location = gets.to_i
    end
  end

  def list_restaurants
    puts "************* Yay! The Following Restaurants in your area are Vegan! *************"


    puts ""
    VeganRestaurantFinder::Restaurant.all.each_with_index(1) do |restaurant, index| puts "#{index}. #{restaurant.name}"
      puts "#{restaurant.summary}"
    end

  end
end