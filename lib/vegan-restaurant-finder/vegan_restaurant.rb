require 'open-uri'
require 'json'


class VeganRestaurant
  @@all = []
  attr_accessor :name, :address1, :city, :region, :phone, :short_description, :website, :rating
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