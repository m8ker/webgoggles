require 'test_helper'

class Api::FacebookControllerTest < ActionController::TestCase
  test "should get friends" do
    get :friends
    assert_response :success
  end

  test "should get messages" do
    get :messages
    assert_response :success
  end

  test "should get photos" do
    get :photos
    assert_response :success
  end

end
