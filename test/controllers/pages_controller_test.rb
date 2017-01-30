require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get how" do
    get pages_how_url
    assert_response :success
  end

  test "should get faqs" do
    get pages_faqs_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end

  test "should get tos" do
    get pages_tos_url
    assert_response :success
  end

  test "should get guidelines" do
    get pages_guidelines_url
    assert_response :success
  end

end
