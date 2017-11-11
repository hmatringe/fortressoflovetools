require 'test_helper'

class PurchaseOrderDraftLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_order_draft_lines_index_url
    assert_response :success
  end

  test "should get show" do
    get purchase_order_draft_lines_show_url
    assert_response :success
  end

  test "should get new" do
    get purchase_order_draft_lines_new_url
    assert_response :success
  end

  test "should get create" do
    get purchase_order_draft_lines_create_url
    assert_response :success
  end

  test "should get edit" do
    get purchase_order_draft_lines_edit_url
    assert_response :success
  end

  test "should get update" do
    get purchase_order_draft_lines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get purchase_order_draft_lines_destroy_url
    assert_response :success
  end

end
