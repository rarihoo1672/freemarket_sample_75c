FactoryBot.define do

  factory :item do
    name                  {"テスト"}
    introduction          {"テストです"}
    category_id           {category.id}
    size                  {"S"}
    status                {"新品、未使用"}
    sipping_cost          {"送料込み（出品者負担）"}
    prefecture_id         {1}
    sipping_days          {"1~2日で発送"}
    price                 {3000}
    user_id               {user.id}
    buyer                 {""}
  end
end