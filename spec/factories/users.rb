FactoryBot.define do

  factory :user do
    nickname              {"tanaka"}
    email                 {"test@email.com"}
    password              {"abc1234"}
    password_confirmation {"abc1234"}
    user_image            {""}
    introduction          {""}
    last_name             {"田中"}
    first_name            {"太郎"}
    lastname_kana         {"タナカ"}
    firstname_kana        {"タロウ"}
    birth_day             {"2000-01-01"}
  end

end