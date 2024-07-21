FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "Item Title #{n}" }
    sequence(:description) { |n| "This is the description for item #{n}" }
    price { 12.34 }
    association :user
  end
end