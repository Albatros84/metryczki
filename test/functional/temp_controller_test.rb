require 'test_helper'

class TempControllerTest < ActionController::TestCase
  test "should get myupdate" do
    get :myupdate
    assert_response :success
  end

end
