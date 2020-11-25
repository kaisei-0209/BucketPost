require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#create' do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let!(:like) { create(:like, user: user, post: post) }

    it "投稿とユーザーが存在すれば保存されること" do
      expect(like).to be_valid
    end

    it "一つの投稿に同じユーザーが2回以上保存できないこと" do
      like = build(:like, user: user, post: post)
      like.valid?
      expect(like).to_not be_valid
    end

    it "投稿がない場合は保存できないこと" do
      like = build(:like, post: nil)
      like.valid?
      expect(like).to_not be_valid
    end

    it "ユーザーがいない場合は保存されないこと" do
      like = build(:like, user: nil)
      like.valid?
      expect(like).to_not be_valid
    end
  end
end
