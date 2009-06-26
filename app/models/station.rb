class Station
  attr_accessor :name, :latitude, :longitude, :available_bikes, :parking_spots
  def initialize(name, latitude, longitude, available_bikes, parking_spots)
    @name, @latitude, @longitude, @available_bikes, @parking_spots = name, latitude, longitude, available_bikes, parking_spots
  end
end