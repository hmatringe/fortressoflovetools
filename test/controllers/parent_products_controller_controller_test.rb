require 'test_helper'

class ParentProductsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_products_controller_index_url
    assert_response :success
  end

  test "should get new" do
    get parent_products_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get parent_products_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get parent_products_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get parent_products_controller_update_url
    assert_response :success
  end

end
