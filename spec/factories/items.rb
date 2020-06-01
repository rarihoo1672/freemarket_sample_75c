FactoryBot.define do

  factory :item do
    name                  {"テスト"}
    introduction          {"テストです"}
    category              {""}
    size                  {"S"}
    brand                 {"テスト"}
    status                {"新品、未使用"}
    sipping_cost          {"送料込み（出品者負担）"}
    prefecture_id         {1}
    sipping_days          {"1~2日で発送"}
    price                 {3000}
    user_id               {1}
    buyer                 {""}

  end

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

  factory :image do
    image                 {"hogehoge"}
  end
end