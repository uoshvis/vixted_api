require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    generate_users
    @user1 = User.all.first
    post "/api/v1/auth/login",
      params: {username: @user1.username, password: @user1.username},
      as: :json
    assert_response :success, "login failed"
    @token = response.parsed_body["token"]
    assert !!@token, 'no token'
    puts "logins and gets user1 token"
  end

  test "should get user index" do
    get "/api/v1/users", headers: { Authorization: "Bearer #{@token}" }
    assert_response :success, "bad login"
    assert_equal response.parsed_body.length, User.all.count, "user count does not match"
    puts "gets user index"
  end

  test "should not get users with invalid token" do
    get "/api/v1/users", headers: { Authorization: "Bearer invalid_token" }
    assert_response :unauthorized
    json_response = JSON.parse(response.body)
    assert_equal "Please log in", json_response['message']
    puts "does not gets users without token"
  end

  test "should get show" do
    get "/api/v1/users/#{@user1.id}", headers: { Authorization: "Bearer #{@token}" }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_not_empty json_response
    assert_equal json_response["username"],  @user1.username
  end
end