require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "get index" do
    get :index
    assert_response :success
  end
  
  # describe AdminsController do
  #   describe "GET index" do
  #     it 'render a list of admins' do
  #       ad = create(:Admin)
  #       Admin.should_receive(:all)
  #       get :index
  #       response.response_code.should == 200
  #     end
  #   end
  # end
  # test "should be all" do
  #   newAdmin = Admin.create
  #   get :index
  #   expect(assigns(:newAdmin)).to eq([newAdmin])
  # end
end
