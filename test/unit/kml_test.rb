require File.join(File.dirname(__FILE__), '..', 'test_helper')

class KmlTest < ActiveSupport::TestCase
  def test_station_parsing
    stations = Kml.stations(IO.read("#{RAILS_ROOT}/test/files/2009_06_25_20_35_01_stations.kml"))
    
    assert_equal Station, stations.first.class
    
    hotel_de_ville = stations.detect {|s| s.name == "Hôtel de ville"}
    assert_not_nil hotel_de_ville
    assert_equal   "9", hotel_de_ville.available_bikes
    assert_equal   "6", hotel_de_ville.parking_spots
    assert_equal   "-73.55372", hotel_de_ville.latitude
    assert_equal   "45.50853", hotel_de_ville.longitude   
  end
end