require 'test_helper'

class JumpingMongosControllerTest < ActionController::TestCase
  setup do
    @jumping_mongo = jumping_mongos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jumping_mongos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jumping_mongo" do
    assert_difference('JumpingMongo.count') do
      post :create, jumping_mongo: { name: @jumping_mongo.name, slackline_id: @jumping_mongo.slackline_id }
    end

    assert_redirected_to jumping_mongo_path(assigns(:jumping_mongo))
  end

  test "should show jumping_mongo" do
    get :show, id: @jumping_mongo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jumping_mongo
    assert_response :success
  end

  test "should update jumping_mongo" do
    put :update, id: @jumping_mongo, jumping_mongo: { name: @jumping_mongo.name, slackline_id: @jumping_mongo.slackline_id }
    assert_redirected_to jumping_mongo_path(assigns(:jumping_mongo))
  end

  test "should destroy jumping_mongo" do
    assert_difference('JumpingMongo.count', -1) do
      delete :destroy, id: @jumping_mongo
    end

    assert_redirected_to jumping_mongos_path
  end
end
