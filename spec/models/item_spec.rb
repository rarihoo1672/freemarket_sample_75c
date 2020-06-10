require 'rails_helper'
describe Item do
  describe '#create#update' do
    it "brandとbuyer以外の項目が入力されていれば登録できること" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user_id: user.id, category_id: category.id)
      expect(item).to be_valid
    end
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "introductionがない場合は登録できないこと" do
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    it "statusがない場合は登録できないこと" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end
    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: "")
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end
    it "shipping_costがない場合は登録できないこと" do
      item = build(:item, shipping_cost: "")
      item.valid?
      expect(item.errors[:shipping_cost]).to include("を入力してください")
    end
    it "shipping_daysがない場合は登録できないこと" do
      item = build(:item, shipping_days: "")
      item.valid?
      expect(item.errors[:shipping_days]).to include("を入力してください")
    end
    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
    it "user_idがない場合は登録できないこと" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
  end
end