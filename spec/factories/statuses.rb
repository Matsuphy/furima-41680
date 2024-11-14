FactoryBot.define do
  factory :status do
    association :user
    association :item
  end
end
