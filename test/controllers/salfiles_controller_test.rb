require 'test_helper'

class SalfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salfiles_index_url
    assert_response :success
  end

  test "should get new" do
    get salfiles_new_url
    assert_response :success
  end

  test "should get create" do
    get salfiles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get salfiles_destroy_url
    assert_response :success
  end

end
