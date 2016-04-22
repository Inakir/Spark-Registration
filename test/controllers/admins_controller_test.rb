require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  describe AdminsController do
    test "should be all" do
      controller.index should == Admin.all  
    end
  end
  # test "should be all" do
  #   newAdmin = Admin.create
  #   get :index
  #   expect(assigns(:newAdmin)).to eq([newAdmin])
  # end
end
