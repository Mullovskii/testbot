require 'test_helper'

class UserSaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_say = user_says(:one)
  end

  test "should get index" do
    get user_says_url
    assert_response :success
  end

  test "should get new" do
    get new_user_say_url
    assert_response :success
  end

  test "should create user_say" do
    assert_difference('UserSay.count') do
      post user_says_url, params: { user_say: { bot_id: @user_say.bot_id, input: @user_say.input, lesson_id: @user_say.lesson_id, user_id: @user_say.user_id } }
    end

    assert_redirected_to user_say_url(UserSay.last)
  end

  test "should show user_say" do
    get user_say_url(@user_say)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_say_url(@user_say)
    assert_response :success
  end

  test "should update user_say" do
    patch user_say_url(@user_say), params: { user_say: { bot_id: @user_say.bot_id, input: @user_say.input, lesson_id: @user_say.lesson_id, user_id: @user_say.user_id } }
    assert_redirected_to user_say_url(@user_say)
  end

  test "should destroy user_say" do
    assert_difference('UserSay.count', -1) do
      delete user_say_url(@user_say)
    end

    assert_redirected_to user_says_url
  end
end
