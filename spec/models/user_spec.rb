require 'rails_helper'
describe User do
  describe '#create' do
    it "user_imageとintroduction以外の項目が入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end
    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "lastname_kanaがない場合は登録できないこと" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end
    it "firstname_kanaがない場合は登録できないこと" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end
    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    it " passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "abc123")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください", "は不正な値です")
    end
    it " passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "abc1234")
      expect(user).to be_valid
    end
    it " passwordに英数字以外が含まれていれば登録できないこと" do
      user = build(:user, password: "abc_123")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it " last_nameが全角文字以外であれば登録できないこと" do
      user = build(:user, last_name: "tanaka")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end
    it " first_nameが全角文字以外であれば登録できないこと" do
      user = build(:user, first_name: "tarou")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end
    it " lastname_kanaがカタカナ以外であれば登録できないこと" do
      user = build(:user, lastname_kana: "田中")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("は不正な値です")
    end
    it " firstname_kanaがカタカナ以外であれば登録できないこと" do
      user = build(:user, firstname_kana: "太郎")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は不正な値です")
    end
  end
end