FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@mail.com" }
    password { "pass" }
  end
end

# create a user with items
def generate_user_with_items(item_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:item, item_count, user: user)
  end
end

# generate 10 users
def generate_users
  FactoryBot.build_list(:user, 10) do |user, i|
    user.username = "username#{i}" 
    user.email = "username#{i}@mail.com"
    user.password = "pass"
    user.save
  end
end