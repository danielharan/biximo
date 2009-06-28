require 'hpricot'
require 'station'

class Kml
  def self.stations(file)
    doc = Hpricot.XML(file)
    
    stations = (doc / 'Placemark').collect do |s|
      lng, lat = s.at('Point/coordinates').innerHTML.split(',')
      available_bikes, parking_spots = s.at('name').innerHTML.match(/: (\d+).*:(\d+)/)[1,2]
      
      Station.new(s.at('description').innerHTML, lat, lng, available_bikes, parking_spots)
    end
  end
end