require 'test_helper'

class SplashesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get splashes_home_url
    assert_response :success
  end

  test "should get chess" do
    get splashes_chess_url
    assert_response :success
  end

end
