require File.join(File.dirname(__FILE__), '..', 'test_helper')

class StationTest < ActiveSupport::TestCase
  def test_fill_ratio
    assert_equal 0.5, Station.new(nil, nil, nil, 5, 5).fill_ratio
    
    assert_equal 0.0, Station.new(nil, nil, nil, 0, 10).fill_ratio
    
    assert_equal 1.0, Station.new(nil, nil, nil, 10, 0).fill_ratio
  end
end