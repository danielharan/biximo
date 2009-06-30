require File.join(File.dirname(__FILE__), '..', 'test_helper')

class StationTest < ActiveSupport::TestCase
  def test_fill_ratio
    assert_equal 0.5, Station.new(nil, nil, nil, 5, 5).fill_ratio
    
    assert_equal 0.0, Station.new(nil, nil, nil, 0, 10).fill_ratio
    
    assert_equal 1.0, Station.new(nil, nil, nil, 10, 0).fill_ratio
  end
  
  def test_positioning
    # >>> map.getBounds().getSouthWest()
    # (45.4838452797276, -73.62831115722656) Ye=45.4838452797276 Ua=-73.62831115722656
    # >>> map.getBounds().getNorthEast()
    # (45.5560111391413, -73.52531433105469) Ye=45.5560111391413 Ua=-73.52531433105469
    bounds = {:left_lng => -73.62831115722656, :right_lng => -73.52531433105469, :top_lat => 45.5560111391413, :low_lat => 45.4838452797276}
    
    s = Station.new('in the middle', ((bounds[:top_lat] + bounds[:low_lat])/2).to_s, ((bounds[:left_lng] + bounds[:right_lng] ) / 2).to_s, 0, 0)
    
    assert_in_delta 0.5, s.convert_lat_lng_to_relative_position(bounds)[0], 0.001
    assert_in_delta 0.5, s.convert_lat_lng_to_relative_position(bounds)[1], 0.001
    
    s = Station.new('', 45.501886744581, -73.6025619506836, 0, 0)
    
    assert_in_delta 0.25, s.convert_lat_lng_to_relative_position(bounds)[0], 0.001
    assert_in_delta 0.75, s.convert_lat_lng_to_relative_position(bounds)[1], 0.001
  end
end