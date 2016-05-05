require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get activities" do
    get :activities
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get involvements" do
    get :involvements
    assert_response :success
  end

  test "should get mentorship" do
    get :mentorship
    assert_response :success
  end

end
