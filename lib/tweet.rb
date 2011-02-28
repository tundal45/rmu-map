require 'geokit'

class Tweet
  attr_accessor :text, :screen_name, :profile_image, :geo, :location, :lat, :long
  
  def get_lat_long
    data = geo || location
    
    if geo.nil? || geo[:coordinates].nil?
      @lat, @long = Geokit::Geocoders::GoogleGeocoder.geocode(data).ll.split(',')
    else
      @lat, @long = Geokit.new(geo[:coordinates].first, geo[:coordinates].last)
    end
  end
end
