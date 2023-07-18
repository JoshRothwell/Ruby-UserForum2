require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference('User.count') do
      post new_user_registration_path, params: { user: { username: 'test_user', password: 'password', email: 'test@example.com' } }
    end

    assert_redirected_to user_path(User.last)
  end
end
