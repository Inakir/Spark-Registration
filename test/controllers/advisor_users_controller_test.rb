require 'test_helper'

class AdvisorUsersControllerTest < ActionController::TestCase
  setup do
    @advisor_user = advisor_users(:one)
    #@advisor_user2 = advisor_users(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:advisor_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advisor_user" do
    assert_difference('AdvisorUser.count') do
      post :create, advisor_user: { password: @advisor_user.password, username: "hollo@tamu.edu", first_name: @advisor_user.first_name,
					 last_name: @advisor_user.last_name,  school_name: @advisor_user.school_name,
						school_level: @advisor_user.school_level,  pay_code: "N" }
    end

    assert_redirected_to advisor_user_path(assigns(:advisor_user))
  end

  test "should show advisor_user" do
    get :show, id: @advisor_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advisor_user
    assert_response :success
  end

  test "should update advisor_user" do
    patch :update, id: @advisor_user, advisor_user: { password: @advisor_user.password, username: @advisor_user.username }
    assert_redirected_to advisor_user_path(assigns(:advisor_user))
  end

  test "should destroy advisor_user" do
    assert_difference('AdvisorUser.count', -1) do
      delete :destroy, id: @advisor_user
    end

    assert_redirected_to advisor_users_path
  end
end
