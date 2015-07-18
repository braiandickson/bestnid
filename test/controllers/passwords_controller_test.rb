require 'test_helper'

class PasswordsControllerTest < ActionController::TestCase
  test "should get change" do
    get :change
    assert_response :success
  end

end
