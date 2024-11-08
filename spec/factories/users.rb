FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.com'}
    password              {'ABC12345'}
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'太郎'}
    last_name_k           {'テスト'}
    first_name_k          {'タロウ'}
    date_of_birth         { Date.new(1990, 10, 12) }
  end
end