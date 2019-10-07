require 'test_helper'

class StaticePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get statice_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get statice_pages_help_url
    assert_response :success
  end

  test "should get about" do
    get statice_pages_about_url
    assert_response :success
  end

end
