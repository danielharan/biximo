class Station
  attr_accessor :name, :latitude, :longitude, :available_bikes, :parking_spots, :timeline
  def initialize(name, latitude, longitude, available_bikes, parking_spots)
    @name, @latitude, @longitude, @available_bikes, @parking_spots, @timeline = name, latitude, longitude, available_bikes, parking_spots, []
  end
  
  def fill_ratio
    @available_bikes.to_f / (@available_bikes.to_i + @parking_spots.to_i)
  end
  
  def history
    {:name => @name, :latitude => @latitude, :longitude => @longitude, :timeline => @timeline}
  end
  
  def convert_lat_lng_to_relative_position(bounds)
    [
      (bounds[:left_lng] - @longitude.to_f) / (bounds[:left_lng] - bounds[:right_lng]), 
      (bounds[:top_lat]  - @latitude.to_f)  / (bounds[:top_lat]  - bounds[:low_lat])
    ]
  end
end