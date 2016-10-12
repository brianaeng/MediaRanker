require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: books(:book1).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create" do
    params = {book: {title: 'test', num_votes: 0, author: 'bob', description: 'none'}}
    post :create, params
    assert_response :redirect
  end

  test "creating should add one to the database" do
    assert_difference('Book.count', 1) do
      params = {book: {title: 'test', num_votes: 0, author: 'bob', description: 'none'}}
      post :create, params
    end
  end

  test "should be able to upvote" do
    patch :upvote, {id: books(:book1).id}
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, {id: books(:book1).id}
    assert_response :success
  end

  test "should be able to update" do
    patch :update, id: books(:book1).id, book: {title: "new title", author: "new author", description: "new descrip"}
    assert_response :redirect
  end

  test "should be able to destroy" do
    delete :destroy, {id: books(:book1).id}
    assert_response :redirect
  end

  test "destroying should subtract one to the database" do
    assert_difference('Book.count', -1) do
      post :destroy, {id: books(:book1).id}
    end
  end

end
