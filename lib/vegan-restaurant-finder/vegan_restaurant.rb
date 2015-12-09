require 'open-uri'
require 'json'


class VeganRestaurant
  attr_accessor :name, :address1, :city, :region, :phone, :short_description, :website
  
  def self.find_by_postcode(postcode)
    # 1. constructs a request url 
    url = "http://www.vegguide.org/search/by-address/#{postcode}/filter/veg_level=5"
    
    # 2. performs the request, get a string
    json_response = open(url).read
    
    # 3. parses the string into data the application can understand
    vegan_data = JSON.parse(json_response)

    vegan_data["entries"].map{|hash| self.new_from_hash(hash)}
  end

  def self.new_from_hash(hash)
    r = self.new

    r.name =  hash["name"]
    r.address1 =  hash["address1"]
    r.city =  hash["city"]
    r.region =  hash["region"]
    r.phone =  hash["phone"]
    r.short_description =  hash["short_description"]
    r.website = hash["website"]

    r
  end

end