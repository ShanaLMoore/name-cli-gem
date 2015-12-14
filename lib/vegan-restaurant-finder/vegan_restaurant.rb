require 'open-uri'
require 'json'


class VeganRestaurant
  @@all = []
  attr_accessor :name, :address1, :city, :region, :phone, :short_description, :website, :distance, :veg_level_description, :long_description, :reviews_uri, :sortable_name, :postal_code, :user, :is_wheelchair_accessible, :neighborhood, :hours, :cuisines, :weighted_rating, :uri, :veg_level, :creation_datetime, :allows_smoking, :payment_options, :last_modified_datetime, :price_range, :images, :country, :rating_count, :categories, :is_cash_only, :tags, :directions, :accepts_reservations
  def self.all
    @@all
  end


  def self.find_by_postcode(postcode)
    # 1. constructs a request url 
    url = "http://www.vegguide.org/search/by-address/#{postcode}/filter/veg_level=5"
    
    # 2. performs the request, get a string
    json_response = open(url).read
    
    # 3. parses the string into data the application can understand
    vegan_data = JSON.parse(json_response)

    vegan_data["entries"].map{|hash| self.new(hash)}
  end

 
  def self.find(index)
    self.all[index]
  end

  def initialize(attrs = {}) # {:name => "Punch Bar"}, {:rating => 10, :name => "Botany"}
    attrs.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

end