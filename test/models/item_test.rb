require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def test_valid
    assert items(:one).valid?, "invalid fixture"
    assert_not Item.new.valid?, "empty Item should be invalid"
    puts "item fixture is valid"
  end
end
