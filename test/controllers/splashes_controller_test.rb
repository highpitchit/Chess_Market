require 'test_helper'

class SplashesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get splashes_home_url
    assert_response :success
  end

end
