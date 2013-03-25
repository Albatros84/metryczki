require 'test_helper'
require 'minitest/reporters'
MiniTest::Reporters.use!

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
