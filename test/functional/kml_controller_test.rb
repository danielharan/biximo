require 'test_helper'

class KmlControllerTest < ActionController::TestCase
  test "should get bixi_stations" do
    Parser.expects(:fetch).once.returns([Station.new("name", "lat", "long", "14", "2")])
    get :bixi_stations, :format => 'kml'
    assert_response :success
    
    assert_not_nil assigns(:stations)
    assert_equal 'application/vnd.google-earth.kml+xml', @response.content_type
  end
end
