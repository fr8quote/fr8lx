require 'test_helper'

class StatusTimesControllerTest < ActionController::TestCase
  setup do
    @status_time = status_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_time" do
    assert_difference('StatusTime.count') do
      post :create, status_time: { location: @status_time.location, notes: @status_time.notes, status: @status_time.status, trip_id: @status_time.trip_id, user_id: @status_time.user_id }
    end

    assert_redirected_to status_time_path(assigns(:status_time))
  end

  test "should show status_time" do
    get :show, id: @status_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_time
    assert_response :success
  end

  test "should update status_time" do
    patch :update, id: @status_time, status_time: { location: @status_time.location, notes: @status_time.notes, status: @status_time.status, trip_id: @status_time.trip_id, user_id: @status_time.user_id }
    assert_redirected_to status_time_path(assigns(:status_time))
  end

  test "should destroy status_time" do
    assert_difference('StatusTime.count', -1) do
      delete :destroy, id: @status_time
    end

    assert_redirected_to status_times_path
  end
end
