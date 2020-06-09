require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get welcome_about_url
    assert_response :success
  end

  test "should get hobbies" do
    get welcome_hobbies_url
    assert_response :success
  end

  test "should get pictures" do
    get welcome_pictures_url
    assert_response :success
  end

end
