require 'hpricot'

class Station
  attr_accessor :name, :latitude, :longitude, :available_bikes, :parking_spots
  def initialize(name, latitude, longitude, available_bikes, parking_spots)
    @name, @latitude, @longitude, @available_bikes, @parking_spots = name, latitude, longitude, available_bikes, parking_spots
  end
end

class Parser
  attr_accessor :doc, :stations
  def initialize(doc)
    @doc = Hpricot.XML(doc)
  end
  
  def stations
    return @stations unless @stations.nil?
    
    @stations = (@doc / 'station').collect do |s|
      Station.new(
        s.at("name").innerHTML,
        s.at("lat").innerHTML,
        s.at("long").innerHTML,
        s.at("nbBikes").innerHTML,
        s.at("nbEmptyDocks").innerHTML
      )
    end
  end
end
