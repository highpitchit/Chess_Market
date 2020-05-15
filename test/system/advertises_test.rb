require "application_system_test_case"

class AdvertisesTest < ApplicationSystemTestCase
  setup do
    @advertise = advertises(:one)
  end

  test "visiting the index" do
    visit advertises_url
    assert_selector "h1", text: "Advertises"
  end

  test "creating a Advertise" do
    visit advertises_url
    click_on "New Advertise"

    fill_in "Date", with: @advertise.date
    fill_in "Job offer", with: @advertise.job_offer
    fill_in "Title", with: @advertise.title
    fill_in "User", with: @advertise.user_id
    click_on "Create Advertise"

    assert_text "Advertise was successfully created"
    click_on "Back"
  end

  test "updating a Advertise" do
    visit advertises_url
    click_on "Edit", match: :first

    fill_in "Date", with: @advertise.date
    fill_in "Job offer", with: @advertise.job_offer
    fill_in "Title", with: @advertise.title
    fill_in "User", with: @advertise.user_id
    click_on "Update Advertise"

    assert_text "Advertise was successfully updated"
    click_on "Back"
  end

  test "destroying a Advertise" do
    visit advertises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Advertise was successfully destroyed"
  end
end
