require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: movies(:movie1).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    params = {movie: {title: 'test', num_votes: 0, director: 'bob', description: 'none'}}
    post :create, params
    assert_response :redirect
  end

  test "creating should add one to the database" do
    assert_difference('Movie.count', 1) do
      params = {movie: {title: 'test', num_votes: 0, director: 'bob', description: 'none'}}
      post :create, params
    end
  end

  test "should be able to upvote" do
    patch :upvote, {id: movies(:movie1).id}
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: movies(:movie1).id}
    assert_response :success
  end

  test "should be able to update" do
    patch :update, id: movies(:movie1).id, movie: {title: "new title", director: "new director", description: "new descrip"}

    assert_response :redirect
  end

  test "should be able to destroy" do
    delete :destroy, {id: movies(:movie1).id}
    assert_response :redirect
  end

  test "destroying should subtract one to the database" do
    assert_difference('Movie.count', -1) do
      delete :destroy, {id: movies(:movie1).id}
    end
  end

end
