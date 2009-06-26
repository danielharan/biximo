class Station
  attr_accessor :name, :latitude, :longitude, :available_bikes, :parking_spots
  def initialize(name, latitude, longitude, available_bikes, parking_spots)
    @name, @latitude, @longitude, @available_bikes, @parking_spots = name, latitude, longitude, available_bikes, parking_spots
  end
  
  def fill_ratio
    @available_bikes.to_f / (@available_bikes + @parking_spots)
  end
end