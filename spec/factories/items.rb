FactoryBot.define do
  factory :item do
    name           {"ピーコート"}
    price          {"1000"}
    introduction   {"これはTシャツです。"}
    status         {"1"}
    size           {"1"}
    shipping_cost  {"1"}
    shipping_days  {"1"}
    user_id        {"1"}
    prefecture_id  {"1"}
  end
end
