require 'test_helper'

class ElasticSlacklinesControllerTest < ActionController::TestCase
  setup do
    @elastic_slackline = elastic_slacklines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elastic_slacklines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create elastic_slackline" do
    assert_difference('ElasticSlackline.count') do
      post :create, elastic_slackline: { elasticity: @elastic_slackline.elasticity, name: @elastic_slackline.name, weight: @elastic_slackline.weight }
    end

    assert_redirected_to elastic_slackline_path(assigns(:elastic_slackline))
  end

  test "should show elastic_slackline" do
    get :show, id: @elastic_slackline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @elastic_slackline
    assert_response :success
  end

  test "should update elastic_slackline" do
    put :update, id: @elastic_slackline, elastic_slackline: { elasticity: @elastic_slackline.elasticity, name: @elastic_slackline.name, weight: @elastic_slackline.weight }
    assert_redirected_to elastic_slackline_path(assigns(:elastic_slackline))
  end

  test "should destroy elastic_slackline" do
    assert_difference('ElasticSlackline.count', -1) do
      delete :destroy, id: @elastic_slackline
    end

    assert_redirected_to elastic_slacklines_path
  end
end
