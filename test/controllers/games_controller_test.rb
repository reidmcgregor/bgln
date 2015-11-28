require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:reid)
    get :new
    assert_response :success
  end

  test "should be logged in to add a game to a collection" do
    post :create, game: { name: "Machi Koro" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create game when logged in" do
    sign_in users(:reid)

    assert_difference('Game.count') do
      post :create, game: { name: @game.name }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should create game for current user when logged in" do
    sign_in users(:reid)

    assert_difference('Game.count') do
      post :create, game: { name: @game.name, user_id: users(:nate).id }
    end

    assert_redirected_to game_path(assigns(:game))
    assert_equal assigns(:game).user_id, users(:reid).id
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:reid)
    get :edit, id: @game
    assert_response :success
  end

  test "should redirect game update when not logged in" do
    patch :update, id: @game, game: { name: @game.name }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update game when logged in" do
    sign_in users(:reid)
    patch :update, id: @game, game: { name: @game.name }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should update game for current user when logged in" do
    sign_in users(:reid)
    patch :update, id: @game, game: { name: @game.name, user_id: users(:nate).id }
    assert_redirected_to game_path(assigns(:game))
    assert_equal assigns(:game).user_id, users(:reid).id
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
