require 'test_helper'

class KeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key = keys(:one)
  end

  test "should get index" do
    get keys_url
    assert_response :success
  end

  test "should get new" do
    get new_key_url
    assert_response :success
  end

  test "should create key" do
    assert_difference('Key.count') do
      post keys_url, params: { key: { bot_id_id: @key.bot_id_id, name: @key.name, user_say_id: @key.user_say_id } }
    end

    assert_redirected_to key_url(Key.last)
  end

  test "should show key" do
    get key_url(@key)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_url(@key)
    assert_response :success
  end

  test "should update key" do
    patch key_url(@key), params: { key: { bot_id_id: @key.bot_id_id, name: @key.name, user_say_id: @key.user_say_id } }
    assert_redirected_to key_url(@key)
  end

  test "should destroy key" do
    assert_difference('Key.count', -1) do
      delete key_url(@key)
    end

    assert_redirected_to keys_url
  end
end