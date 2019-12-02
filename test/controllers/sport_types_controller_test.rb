require 'test_helper'

class SportTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_type = sport_types(:one)
  end

  test "should get index" do
    get sport_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sport_type_url
    assert_response :success
  end

  test "should create sport_type" do
    assert_difference('SportType.count') do
      post sport_types_url, params: { sport_type: { code: @sport_type.code, name: @sport_type.name, record_status: @sport_type.record_status } }
    end

    assert_redirected_to sport_type_url(SportType.last)
  end

  test "should show sport_type" do
    get sport_type_url(@sport_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sport_type_url(@sport_type)
    assert_response :success
  end

  test "should update sport_type" do
    patch sport_type_url(@sport_type), params: { sport_type: { code: @sport_type.code, name: @sport_type.name, record_status: @sport_type.record_status } }
    assert_redirected_to sport_type_url(@sport_type)
  end

  test "should destroy sport_type" do
    assert_difference('SportType.count', -1) do
      delete sport_type_url(@sport_type)
    end

    assert_redirected_to sport_types_url
  end
end
