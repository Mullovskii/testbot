require 'test_helper'

class AttachementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attachements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get attachements_destroy_url
    assert_response :success
  end

end
