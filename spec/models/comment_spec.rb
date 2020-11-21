require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it "コメント、ポスト、ユーザーがある場合、有効であること" do
    user = create(:user)
    post = create(:post)
    comment = Comment.new(
      content: "コメント",
      post: post,
      user: user,
    )
    expect(comment).to be_valid
  end

  describe "存在性の検証" do
    it "コメントがない場合、無効であること" do
      comment.content = ""
      comment.valid?
      expect(comment).to_not be_valid
    end

    it "ポストがない場合、無効であること" do
      comment.post = nil
      comment.valid?
      expect(comment).to_not be_valid
    end

    it "ユーザーがない場合、無効であること" do
      comment.user = nil
      comment.valid?
      expect(comment).to_not be_valid
    end
  end

  describe "文字数の検証" do
    it "コメントが150文字以内の場合、有効であること" do
      comment.content = "a" * 150
      expect(comment).to be_valid
    end

    it "コメントが151文字以上の場合、無効であること" do
      comment.content = "a" * 151
      expect(comment).to_not be_valid
    end
  end


end
