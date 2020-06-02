FactoryBot.define do
  factory :item do
    name           {"ピーコート"}
    price          {"1000"}
    introduction   {"これはTシャツです。"}
    status         {"新品"}
    size           {"L"}
    shipping_cost  {"送料込み"}
    shipping_days  {"3〜4日で発送"}
    user_id        {"1"}
    prefecture_id  {"1"}
  end
end
