require "application_system_test_case"

class SportTypesTest < ApplicationSystemTestCase
  setup do
    @sport_type = sport_types(:one)
  end

  test "visiting the index" do
    visit sport_types_url
    assert_selector "h1", text: "Sport Types"
  end

  test "creating a Sport type" do
    visit sport_types_url
    click_on "New Sport Type"

    fill_in "Code", with: @sport_type.code
    fill_in "Name", with: @sport_type.name
    fill_in "Record status", with: @sport_type.record_status
    click_on "Create Sport type"

    assert_text "Sport type was successfully created"
    click_on "Back"
  end

  test "updating a Sport type" do
    visit sport_types_url
    click_on "Edit", match: :first

    fill_in "Code", with: @sport_type.code
    fill_in "Name", with: @sport_type.name
    fill_in "Record status", with: @sport_type.record_status
    click_on "Update Sport type"

    assert_text "Sport type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sport type" do
    visit sport_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sport type was successfully destroyed"
  end
end
