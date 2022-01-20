require 'test_helper'

class Member::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get member_items_top_url
    assert_response :success
  end

  test "should get about" do
    get member_items_about_url
    assert_response :success
  end

  test "should get index" do
    get member_items_index_url
    assert_response :success
  end

  test "should get show" do
    get member_items_show_url
    assert_response :success
  end

end
