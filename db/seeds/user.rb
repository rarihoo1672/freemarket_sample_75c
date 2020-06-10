# テストユーザー(購入者用)
buyer = User.new(
  nickname: "フリマ太郎",
  email: "hoge@hoge.com",
  password: "hoge1234",
  password_confirmation: "hoge1234",
  last_name: "フリマ",
  first_name: "太郎",
  lastname_kana: "フリマ",
  firstname_kana: "タロウ",
  birth_day: "2000-01-01",
)
buyer.save!

buyer_address = Address.new(
  last_name: "フリマ",
  first_name: "太郎",
  lastname_kana: "フリマ",
  firstname_kana: "タロウ",
  post_code: "123-4567",
  prefecture_id: "13",
  city: "渋谷区",
  address: "道玄坂3-2",
  user_id: buyer.id
)
buyer_address.save!

# テストユーザー(出品者用)
seller = User.new(
  nickname: "フリマ花子",
  email: "huga@huga.com",
  password: "huga1234",
  password_confirmation: "huga1234",
  last_name: "フリマ",
  first_name: "花子",
  lastname_kana: "フリマ",
  firstname_kana: "ハナコ",
  birth_day: "2000-01-01",
)
seller.save!

seller_address = Address.new(
  last_name: "フリマ",
  first_name: "花子",
  lastname_kana: "フリマ",
  firstname_kana: "ハナコ",
  post_code: "123-4567",
  prefecture_id: "13",
  city: "渋谷区",
  address: "道玄坂3-2",
  user_id: seller.id
)
seller_address.save!