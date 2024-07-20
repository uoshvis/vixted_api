require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user model valid with factory" do
    @user = create(:user)
    assert @user.valid?, "invalid user"
    puts "user model valid"
  end 

  test "user should be valid" do  
    user = User.new(username: "Bubble", email: "mail@mail.com", password: "pass")
    assert user.valid?
    puts "user is valid"

  end
  test "name should be present" do
    user = User.new(username: "   ", email: "mail@mail.com", password: "pass")
    assert_not user.valid?, "username is empty string"
    puts "username is present"
  end

  test "passord should be present" do
    user = User.new(username: "user1", email: "mail@mail.com", password: "   ")
    assert_not user.valid?, "password is empty string"
    puts "password is present"
  end

  test "email should be present" do
    user = User.new(username: "user", email: "   ", password: "pass")
    assert_not user.valid?, "email is empty string"
    puts "email is present"
  end

  test "user model item_count valid" do
    user_id =  create(:item).user_id
    user =  User.find(user_id)
    assert_equal user.item_count, 1, "invalid user item_count"
    puts "user model item_count valid"
  end

  test "user model user with many items" do
    assert_equal user_with_items.items.length, 5, "invalid user item count"
    user = User.all.first
    assert_equal user.item_count, 5, "invalid user item_count"
    puts "user model user with many items"
  end

end
