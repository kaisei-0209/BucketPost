require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  it "有効なファクトリを持つこと" do
    expect(post).to be_valid
  end

  it "タイトル,内容がある場合、有効であること" do
    user = create(:user)
    post = Post.new(
      title: "やりたいこと",
      content: "今年はスカイダイビングをします！",
      user: user,
    )
    expect(post).to be_valid
  end

  describe "存在性の検証" do
    it "タイトルがない場合、無効であること" do
      post.title = ""
      post.valid?
      expect(post).to_not be_valid
    end

    it "内容がない場合、無効であること" do
      post.content = ""
      post.valid?
      expect(post).to_not be_valid
    end

    it "ユーザーがない場合、無効であること" do
      post.user = nil
      post.valid?
      expect(post).to_not be_valid
    end
  end

  describe "文字数の検証" do
    it "タイトルが20文字以内の場合、有効であること" do
      post.title = "a" * 20
      post.valid?
      expect(post).to be_valid
    end

    it "タイトルが21文字以上の場合、無効であること" do
      post.title = "a" * 21
      post.valid?
      expect(post).to_not be_valid
    end

  end

end
