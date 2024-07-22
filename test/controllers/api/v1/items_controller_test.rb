require "test_helper"

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = CustomFunctions.create_user_with_items
    post "/api/v1/auth/login",
    params: {username: @user.username, password: @user.password},
    as: :json
    assert_response :success, "login failed"    
    @token = response.parsed_body["token"]

    @other_user = CustomFunctions.create_user_with_items
    post "/api/v1/auth/login",
    params: {username: @other_user.username, password: @other_user.password},
    as: :json
    assert_response :success, "login failed"    
    @other_token = response.parsed_body["token"]
  end

  test "should get item index" do
    create(:item)
    get "/api/v1/items"
    assert_response :success
    @item_id = @response.parsed_body[0]["id"]
  end
  test "should get show" do
    get "/api/v1/items/#{@item_id}"
    assert_response :success
  end

  test "should create own item" do
    item_attributes = attributes_for(:item)

    assert_difference('Item.count', 1) do
      post "/api/v1/items/",
      params: item_attributes,
      headers: { Authorization: "Bearer #{@token}"},
      as: :json
    end   
    assert_response :created

    json_response = JSON.parse(response.body)
    assert_equal item_attributes[:title], json_response['title']
    assert_equal @user.id, json_response["user"]['id']
    assert_not_equal @other_user.id, json_response["user"]['id']
  end

  test "should update own item" do
    new_title = "Updated Title"
    item = Item.where(user_id: @user.id).first
    put "/api/v1/items/#{item.id}", params: { title: new_title },
    headers: { Authorization: "Bearer #{@token}" },
    as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal new_title, json_response['title']
  end

  test "should not update other user's item" do
    new_title = "Updated Title"
    item = Item.where(user_id: @user.id).first
    put "/api/v1/items/#{item.id}", params: { title: new_title },
    headers: { Authorization: "Bearer #{@other_token}" },
    as: :json
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_empty json_response['error']
  end

  test "should delete own item" do
    item = Item.where(user_id: @user.id).first
    assert_difference('Item.count', -1) do
      delete "/api/v1/items/#{item.id}",
      headers: { Authorization: "Bearer #{@token}"},
      as: :json
    end   
    assert_response :ok

    json_response = JSON.parse(response.body)
    assert_not_empty json_response['message']
  end

  test "should not delete other user's item" do
    item = Item.where(user_id: @user.id).first
    assert_no_difference('Item.count') do
      delete "/api/v1/items/#{item.id}",
      headers: { Authorization: "Bearer #{@other_token}"},
      as: :json
    end   
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_empty json_response['error']
  end
end
