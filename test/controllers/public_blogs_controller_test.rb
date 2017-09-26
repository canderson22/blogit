require 'test_helper'

class PublicBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_blogs_show_url
    assert_response :success
  end

end
