require 'test_helper'
require 'minitest/reporters'
MiniTest::Reporters.use!

class UsersControllerTest < ActionController::TestCase
 
  setup do
    @user=users(:one)
  end
  
  def login_as(user)
   @request.cookies[:auth_token] = user ? user.auth_token : nil
end
 
  test "should get new" do
    login_as(@user)
    get :new
    assert_response :success
  end

end
