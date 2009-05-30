require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  def setup
    @parser = Parser.new IO.read(fixture_file('bikeStations.xml'))
  end
  
  def test_parses_stations
    stations = @parser.stations
    assert_equal 295, stations.length
    
    hotel_de_ville = stations.detect {|s| s.name == "Hôtel de ville"}
    assert_not_nil hotel_de_ville
    
    assert_equal '45.50853', hotel_de_ville.latitude
  end
end
