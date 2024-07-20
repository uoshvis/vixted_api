require "test_helper"

class ItemTest < ActiveSupport::TestCase
  
  test "item model valid" do
    item = create(:item)
    assert item.valid?, "invalid item"
    assert_not Item.new.valid?, "empty Item should be invalid"
    puts "item model valid"
  end
  
end
