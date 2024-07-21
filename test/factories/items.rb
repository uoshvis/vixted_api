FactoryBot.define do
  factory :item do
    title { "factory item title" }
    description { "factory item description" }
    price {9.87}
    user
  end

end