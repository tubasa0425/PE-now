require 'test_helper'

class InfolistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get infolists_new_url
    assert_response :success
  end

end
