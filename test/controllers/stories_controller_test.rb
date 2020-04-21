require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get stories_show_url
    assert_response :success
  end

  test "should get index" do
    get stories_index_url
    assert_response :success
  end

end
