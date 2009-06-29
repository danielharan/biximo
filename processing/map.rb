class Map < Processing::App
  attr_accessor :ellipse, :img
  def setup
    @img     = image load_image("montreal_gmap.gif"), 0, 0
    fill 255, 0, 0
    @ellipse = oval 100, 100, 55, 55
    
    fill 100, 0, 0
    @ellipse = oval 200, 100, 55, 55
    
    fill 0, 0, 0
    @ellipse = oval 300, 100, 55, 55
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