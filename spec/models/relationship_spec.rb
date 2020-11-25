require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe '#create' do
    let(:follower) { create(:user) }
    let(:following) { create(:user) }
    let!(:relationship) { create(:relationship, follower: follower, following: following) }

    it "followerとfollowingが存在すれば保存されること" do
      expect(relationship).to be_valid
    end

    it "同じfollowerとfollowingの組み合わせが2回以上保存されないこと" do
      relationship = build(:relationship, follower: follower, following: following)
      relationship.valid?
      expect(relationship).to_not be_valid
    end

    it "follower_idがなければ保存できない" do
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end

    it "followed_idがなければ作成できない" do
      relationship.following_id = nil
      expect(relationship).to_not be_valid
    end
  end
end
