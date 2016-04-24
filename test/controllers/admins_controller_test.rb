require 'test_helper'
require_relative '../../spec/spec_helper'
require_relative '../../spec/rails_helper'
require 'rubygems'
require 'test/unit'
require 'rspec'
include Test::Unit::Assertions
if Admin.count == 0
    load Rails.root.join('db/seeds.rb')
end

class AdminsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    
    
    
    assert_response :success
  end
  
  test "get index" do
    get :index
    assert_response :success
  end
  
  # test "mark_unpaid" do
  #   visit '/admins/see_info'
  #   #page.should.have_text 'Eric'
  #   click_button('Mark Unpaid', match: :first)
  # end
  test "mark_paid" do
    visit '/admins/see_info'
    #response.body.should have_content("Eric")
    click_button('Mark Paid', match: :first)
    assert_redirected_to '/admins/mark_paid'
  end
  # test "get edit login" do
  #   get :changelogin
  #   assert_response :success
  # end
  
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
