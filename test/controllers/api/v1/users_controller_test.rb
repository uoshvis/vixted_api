require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
    
  def get_token
    @user = create(:user)
    post "/api/v1/auth/login",
      params: {username: @user.username, password: @user.password},
      as: :json
    assert_response :success, "login failed"    
    @token = response.parsed_body["token"]
  end

  test "test get_token" do
    get_token
    assert !!@token, 'no token'
    puts "logins and gets user token"
  end

  test "should get user index" do
    get_token
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
    get_token
    get "/api/v1/users/#{@user.id}", headers: { Authorization: "Bearer #{@token}" }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_not_empty json_response
    assert_equal json_response["username"],  @user.username
  end
  
  test "should create user with valid attributes" do
    user_attributes = attributes_for(:user)

    assert_difference('User.count', 1) do
      post "/api/v1/users/", params: user_attributes
    end
    assert_response :created

    json_response = JSON.parse(response.body)
    assert_equal user_attributes[:username], json_response["user"]["username"]
  end

  test "should not create user with invalid attributes" do
    invalid_attributes = attributes_for(:user, email: "not email") 

    assert_no_difference('User.count') do
      post api_v1_users_url, params: invalid_attributes
    end
    assert_response :unprocessable_entity

    json_response = JSON.parse(response.body)
    assert_not_empty json_response['error']
  end

end