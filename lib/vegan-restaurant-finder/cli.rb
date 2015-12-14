class VeganRestaurantFinder

  attr_accessor :postcode

  def initialize(postcode = nil)
    @postcode = postcode
    call
  end

  def call(postcode = nil)
    puts "Welcome to Vegan Restaurant Finder!"
    puts "Please enter your zip code. We will list your local vegan restaurants!"

    postcode = gets.strip.to_i
    

    @restaurants = VeganRestaurant.find_by_postcode(postcode)
    list_restaurants(postcode)
  end



  def list_restaurants(postcode)
    @postcode = postcode
    puts "************* Good news! The Following Establishments in #{@postcode} are 100% Vegan! *************"

    puts ""
    @restaurants.each_with_index do |restaurant, index| puts "#{index+1}. #{restaurant.name}"
    end
    more_information
  end

  def more_information
    puts ""
    puts "Want more information? Enter the index number of the restaurant you wish to see."
    index = gets.strip.to_i-1
    puts ""

    if restaurant = VeganRestaurant.find(index)
      puts "Name: #{restaurant.name}"
      puts "Address: #{restaurant.address1}"
      puts "City: #{restaurant.city}"
      puts "Region: #{restaurant.region}"
      puts "Phone: #{restaurant.phone}"
      puts "Description: #{restaurant.short_description}"
      puts "Website: #{restaurant.website}"
    else
      puts "That's an invalid entry!"
    end

    puts ""
    puts "Type 'back' to return to the list of restaurants. Enter any key to end this program." 

    input = gets.strip.downcase

    if input == "back"
      list_restaurants(postcode)
    end

  end
end





