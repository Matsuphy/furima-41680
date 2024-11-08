FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.email }
    password              {'ABC12345'}
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'太郎'}
    last_name_k           {'テスト'}
    first_name_k          {'タロウ'}
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 70 )}
  end
end