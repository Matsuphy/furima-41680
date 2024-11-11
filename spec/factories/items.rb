FactoryBot.define do
  factory :item do
    name                {"テストテストテストテスト"}
    item_description    {"テストテストテストテストテストテストテストテストテストテストテストテストテストテスト"}
    category_id         {2}
    condition_id        {3}
    price               {30000}
    shipping_fee_id     {3}
    region_id           {20}
    shipping_day_id     {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
