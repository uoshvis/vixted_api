
module CustomFunctions

  def self.create_users_with_items(user_count: 5, items_per_user: 3)
    users = []

    user_count.times do
      user = FactoryBot.create(:user)
      items_per_user.times do
        FactoryBot.create(:item, user: user)
      end
      users << user
    end

    users
  end
  # create a user with items
  def self.create_user_with_items(item_count: 5)
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:item, item_count, user: user)
    end
  end

  # generate users
  def self.create_users(user_count: 10)
    FactoryBot.build_list(:user, user_count) do |user, i|
      user.username = "username#{i}" 
      user.email = "username#{i}@mail.com"
      user.password = "pass"
      user.save
    end
  end

end