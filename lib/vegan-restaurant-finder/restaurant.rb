class VeganRestaurantFinder::Restaurant

  attr_accessor :location

  def initialize (location)
    @location = location
  end


  def restaurant_info
    @restaurant_info ||= 
  end

  private
  def self.scrape_location
    doc = Nokogiri::HTML(open('http://www.happycow.net/'))

    doc.css("div.search")
  end

  def restaurant_info
    @restaurant_info_doc ||= Nokogiri::HTML(open("#{self.url}restaurantinfo"))
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
end

name = address

search map data lat and long

googleapi

class = aTitle = name of restuarants

 class sidebar-entry odd span address = restaurant info