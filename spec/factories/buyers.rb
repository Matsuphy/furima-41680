FactoryBot.define do
  factory :buyer do
    post_code       {"123-1234"}
    region_id       {3}
    city            {"ABC市DE町"}
    street          {"3-3-3"}
    room            {"FGHマンション-909"}
    phone_number    {"09099998888"}

    association :status
  end
end
