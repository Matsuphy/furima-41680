FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'ABC12345'}
    password_confirmation {password}
    last_name             {}
    first_name            {}
    last_name_k           {}
    first_name_k          {}
    date_of_birth         {}
  end
end