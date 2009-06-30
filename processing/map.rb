$: << "../app/models/"
require 'station'

class Map < Processing::App
  BOUNDS = {:left_lng => -73.62831115722656, :right_lng => -73.52531433105469, :top_lat => 45.5560111391413, :low_lat => 45.4838452797276}

  attr_accessor :stations, :img, :current_frame
  def setup
    color_mode RGB, 1.0
    smooth
    frame_rate 12
    @current_frame = 0

    @img  = load_image("montreal_gmap.gif")
    background @img
    
    # JSON animation that was done for the web.
    # Processing has its own JRuby distro, and both Nokogiri and HPricot are $%^& pain
    # this is an ugly hack, but it's lazy and it works for now
    @stations = eval(IO.read("./data/2009_06_24").gsub(":", "=>")).collect do |datum|
      a = AnimatedStation.new datum
      a.draw
      a
    end
  end
  
  def draw
    
  end
  
  class AnimatedStation
    def initialize(options)
      @options = options # latitude, longitude, timeline
      @x, @y = convert_lat_lng_to_relative_position
    end
    
    def draw
      fill 0.7, 0, 0, @options["timeline"][0]
      oval @x * 600, @y * 600, 7, 7
    end
    
    def convert_lat_lng_to_relative_position
      [
        (BOUNDS[:left_lng] - @options["longitude"].to_f) / (BOUNDS[:left_lng] - BOUNDS[:right_lng]), 
        (BOUNDS[:top_lat]  - @options["latitude"].to_f)  / (BOUNDS[:top_lat]  - BOUNDS[:low_lat])
      ]
    end
  end
end

Map.new(:width => 600, :height => 600, :title => "Montreal Bixi Map")

# Info about the static map:
# >>> map.getBounds().getSouthWest()
# (45.4838452797276, -73.62831115722656) Ye=45.4838452797276 Ua=-73.62831115722656
# >>> map.getBounds().getNorthEast()
# (45.5560111391413, -73.52531433105469) Ye=45.5560111391413 Ua=-73.52531433105469
# 
# 1 - parse a kml file
# 2 - place stations on a map
# 3 - ensure you can adjust a station's fill