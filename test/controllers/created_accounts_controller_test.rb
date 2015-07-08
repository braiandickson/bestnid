require 'test_helper'

class CreatedAccountsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
