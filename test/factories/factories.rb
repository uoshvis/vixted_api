FactoryBot.define do
  factory :item do
    title { "factory item title" }
    description { "factory item description" }
    price {9.87}
    user
  end

  factory :user do
    username { "factory_boy" }
    password { "pass1" }
    email { "mail@mail.com" }
  end
end

def user_with_items(item_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:item, item_count, user: user)
  end
end

def generate_users
  FactoryBot.build_list(:user, 10) do |user, i|
    user.username = "username#{i}" 
    user.email = "username#{i}@mail.com"
    user.password = "username#{i}"
    user.save
  end
end