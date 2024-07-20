require "test_helper"

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
 
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
end
