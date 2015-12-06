require 'pry'
require 'json'
require 'open-uri'

# class VeganRestaurantFinder::CLI

#   attr_accessor :postcode

#   def initialize(postcode)
#     @postcode = postcode
#     call
#   end

  def call(postcode=nil)
    puts "Welcome to Vegan Restaurant Finder!"
    
    until postcode == "exit"
        puts "Please enter your zip code. We will list your local vegan restaurants!"
        puts "Type 'exit' to end this program."
        postcode = gets.strip.to_i
        get_vegan_restaurants_for_postcode(postcode)
    end
  end

  # def list_restaurants
  #   puts "************* Yay! The Following Restaurants in your area are Vegan! *************"

  #   puts ""
  #   VeganRestaurantFinder::Restaurant.all.each_with_index(1) do |restaurant, index| puts "#{index}. #{restaurant.name}"

  #   puts "Want more information? Enter the index number of the restaurant you wish to see."
  #   index = gets.strip.to_i
      
  #   puts "#{restaurant.summary}"
  # end


  # private 
  def get_vegan_restaurants_for_postcode(postcode)
    # 1. constructs a request url 
    url = "http://www.vegguide.org/search/by-address/#{postcode}/filter/veg_level=5"
    
    # 2. performs the request, get a string
    json_response = open(url).read
    
    # 3. parses the string into data the application can understand
    vegan_data = JSON.parse(json_response)
    entries = vegan_data["entries"]  
    entries.map do |hash|
      @restaurant_names = hash["name"]
    end
  end

  binding.pry



