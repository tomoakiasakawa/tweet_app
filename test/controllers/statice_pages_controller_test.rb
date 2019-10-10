require 'test_helper'

class StaticePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get statice_pages_contact_url
    assert_response :success
  end

end
