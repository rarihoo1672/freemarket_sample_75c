require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "message,user_id,item_idがあれば有効" do
    user = create(:user)
    category = create(:category)
    item = create(:item, user_id: user.id, category_id: category.id)
    comment = Comment.new(
      message: "test",
      user_id: user.id,
      item_id: item.id
    )
    expect(comment).to be_valid
  end

  it "メッセージがなければ無効" do
    comment = Comment.new(message: nil)
    comment.valid?
    expect(comment.errors[:message]).to include("を入力してください")
  end

  it "user_idがなければ無効" do
    comment = Comment.new(user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include("を入力してください")
  end

  it "item_idがなければ無効" do
    comment = Comment.new(item_id: nil)
    comment.valid?
    expect(comment.errors[:item_id]).to include("を入力してください")
  end
end
