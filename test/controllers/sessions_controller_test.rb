require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  # test "nil session login" do
  #   visit '/advisor/index'
  #   assert_redirected_to '/registration_home/index'
  # end
  # describe SessionController do
  #   it "nil session login" do
      
  #   end
  # end
end
