require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  test "should get show" do
    get :show, id: users(:reid).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:reid).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:games)
  end

  test "only shows games in the users collection" do
    get :show, id: users(:reid).profile_name
    assigns(:games).each do |game|
      assert_equal users(:reid), game.user
    end
  end

end
