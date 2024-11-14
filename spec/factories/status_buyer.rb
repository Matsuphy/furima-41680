FactoryBot.define do
  factory :status_buyer do
    token           {"tok_abcdefghijkl0000000000000000"}

    post_code       {"123-1234"}
    region_id       {3}
    city            {"ABC市DE町"}
    street          {"3-3-3"}
    room            {"FGHマンション-909"}
    phone_number    {"09099998888"}

    user_id          {1}
    item_id          {2}
  end
end