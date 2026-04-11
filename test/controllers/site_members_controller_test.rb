require "test_helper"

class SiteMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_members_index_url
    assert_response :success
  end

  test "should get new" do
    get site_members_new_url
    assert_response :success
  end

  test "should get edit" do
    get site_members_edit_url
    assert_response :success
  end
end
