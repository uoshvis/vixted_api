require "test_helper"

class UserTest < ActiveSupport::TestCase
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

end
