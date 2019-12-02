require 'test_helper'

class RegistrationFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_form = registration_forms(:one)
  end

  test "should get index" do
    get registration_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_form_url
    assert_response :success
  end

  test "should create registration_form" do
    assert_difference('RegistrationForm.count') do
      post registration_forms_url, params: { registration_form: { form_number: @registration_form.form_number, partner_id: @registration_form.partner_id, record_status: @registration_form.record_status, sport_type_id: @registration_form.sport_type_id } }
    end

    assert_redirected_to registration_form_url(RegistrationForm.last)
  end

  test "should show registration_form" do
    get registration_form_url(@registration_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_form_url(@registration_form)
    assert_response :success
  end

  test "should update registration_form" do
    patch registration_form_url(@registration_form), params: { registration_form: { form_number: @registration_form.form_number, partner_id: @registration_form.partner_id, record_status: @registration_form.record_status, sport_type_id: @registration_form.sport_type_id } }
    assert_redirected_to registration_form_url(@registration_form)
  end

  test "should destroy registration_form" do
    assert_difference('RegistrationForm.count', -1) do
      delete registration_form_url(@registration_form)
    end

    assert_redirected_to registration_forms_url
  end
end
