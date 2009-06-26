require File.join(File.dirname(__FILE__), '..', 'test_helper')

class TimelineTest < ActiveSupport::TestCase
  def test_retrieve_files_for_a_single_day
    t = Timeline.new(Date.civil(2009,06,24))
    
    assert_equal 288, t.files.length
  end
  
  def test_retrieve_files_for_two_days
    t = Timeline.new(Date.civil(2009,06,23),Date.civil(2009,06,24))
    
    assert_equal 288 * 2, t.files.length
  end
end
