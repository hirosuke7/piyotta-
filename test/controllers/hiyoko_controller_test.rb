require 'test_helper'

class HiyokoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hiyoko_index_url
    assert_response :success
  end

  test "should get show" do
    get hiyoko_show_url
    assert_response :success
  end

  test "should get new" do
    get hiyoko_new_url
    assert_response :success
  end

  test "should get create" do
    get hiyoko_create_url
    assert_response :success
  end

  test "should get edit" do
    get hiyoko_edit_url
    assert_response :success
  end

  test "should get update" do
    get hiyoko_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hiyoko_destroy_url
    assert_response :success
  end

end
