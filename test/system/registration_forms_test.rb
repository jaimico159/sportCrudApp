require "application_system_test_case"

class RegistrationFormsTest < ApplicationSystemTestCase
  setup do
    @registration_form = registration_forms(:one)
  end

  test "visiting the index" do
    visit registration_forms_url
    assert_selector "h1", text: "Registration Forms"
  end

  test "creating a Registration form" do
    visit registration_forms_url
    click_on "New Registration Form"

    fill_in "Form number", with: @registration_form.form_number
    fill_in "Partner", with: @registration_form.partner_id
    fill_in "Record status", with: @registration_form.record_status
    fill_in "Sport type", with: @registration_form.sport_type_id
    click_on "Create Registration form"

    assert_text "Registration form was successfully created"
    click_on "Back"
  end

  test "updating a Registration form" do
    visit registration_forms_url
    click_on "Edit", match: :first

    fill_in "Form number", with: @registration_form.form_number
    fill_in "Partner", with: @registration_form.partner_id
    fill_in "Record status", with: @registration_form.record_status
    fill_in "Sport type", with: @registration_form.sport_type_id
    click_on "Update Registration form"

    assert_text "Registration form was successfully updated"
    click_on "Back"
  end

  test "destroying a Registration form" do
    visit registration_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registration form was successfully destroyed"
  end
end
