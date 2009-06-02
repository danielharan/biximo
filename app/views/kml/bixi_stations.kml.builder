xml.instruct! :xml
xml.kml(:xmlns => "http://earth.google.com/kml/2.2") do
  xml.Document {
    xml.name "Bixi stations"
    xml.Style(:id => "default_bixi_icon") {
      xml.IconStyle {
        xml.Icon {
          xml.href 'http://www.biximo.com/images/bixi_icon.png'
        }
      }
    }
    @stations.each do |station|
      xml.Placemark {
        xml.name "#{station.available_bikes} bixis, #{station.parking_spots} parking spots @ #{station.name}"
        xml.styleUrl '#default_bixi_icon'
        xml.Point {
          xml.coordinates "#{station.longitude},#{station.latitude}"
        }
      }
    end
  }
end