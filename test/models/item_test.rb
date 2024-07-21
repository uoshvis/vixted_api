require "test_helper"

class ItemTest < ActiveSupport::TestCase
  
  test "item model valid" do
    item = create(:item)
    assert item.valid?, "invalid item"
    assert_not Item.new.valid?, "empty Item should be invalid"
    puts "item model valid"
  end
  
  test "should create item with valid attributes" do
    user = create(:user)
    item = create(:item, user: user)
    
    assert item.valid?
    assert_equal user, item.user
    assert_not_nil item.title
    assert_not_nil item.description
    assert item.price > 0
  end
  
end
