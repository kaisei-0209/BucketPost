require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  describe "#create" do
    context "パラメータが揃っている場合" do
      it "正常に登録できること" do
        content = build(:comment, content: "応援します！", post: post)
        expect { content.save }.to change { post.comments.count }.by(1)
      end
    end

    context "パラメータが揃っていない場合" do
      it "登録できないこと" do
        content = build(:comment, content: "", post: post)
        expect { content.save }.to change { post.comments.count }.by(0)
      end
    end
  end

  describe "#destroy" do
    it "正常に削除できること" do
      content = create(:comment, post: post)
      expect { content.destroy }.to change { post.comments.count }.by(-1)
    end
  end
end
