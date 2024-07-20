FactoryBot.define do
  factory :user do
    username { "factory_boy" }
    password { "pass1" }
    email { "mail@mail.com" }
  end
end

FactoryBot.define do
  factory :item do
    title { "factory title" }
    description { "factory description" }
    price {9.87}
    user
  end
end