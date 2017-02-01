require 'test_helper'

class WineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wine_index_url
    assert_response :success
  end

end
