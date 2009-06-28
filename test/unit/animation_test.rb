require File.join(File.dirname(__FILE__), '..', 'test_helper')

class AnimationTest < ActiveSupport::TestCase
  def test_retrieve_files_for_a_single_day
    a = Animation.new(Date.civil(2009,06,24))
    
    assert_equal 288, a.files.length
  end
  
  def test_retrieve_files_for_two_days
    a = Animation.new(Date.civil(2009,06,23),Date.civil(2009,06,24))
    
    assert_equal 288 * 2, a.files.length
  end
  
  def test_stations
    a = Animation.new(Date.civil(2009,06,24))
    
    # speed this up a bit!
    a.stubs(:files).returns(["#{RAILS_ROOT}/public/data/2009_06_24_00_00_01_stations.kml", "#{RAILS_ROOT}/public/data/2009_06_24_00_05_01_stations.kml"])
    
    stations = a.stations
    assert_equal Array,   stations.class
    assert_equal Station, stations.first.class, stations.first.inspect
    
    assert_equal Array, stations.first.timeline.class
    assert_equal 2, stations.first.timeline.length
  end
end
