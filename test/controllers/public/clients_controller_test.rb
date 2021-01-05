require 'test_helper'

class Public::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_clients_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_clients_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_clients_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_clients_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_clients_withdraw_url
    assert_response :success
  end

end
