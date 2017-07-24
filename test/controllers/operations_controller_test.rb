require 'test_helper'

class OperationsControllerTest < ActionController::TestCase
  test "should get perform" do
    get :perform
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
