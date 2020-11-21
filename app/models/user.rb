class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable
        validates :name, presence: true, length: { maximum: 10 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
        before_validation { email.downcase! }
        validates :email,
                  presence: true,
                  uniqueness: { case_sensitive: true },
                  length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX, allow_blank: true }
        #createアクションにのみpasswordを適用する
        validates :password, presence: true, length: { minimum: 6, allow_blank: true }, on: :create
        validates :profile, length: { maximum: 200 }

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # フォローしているか
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  # フォローする
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  # リムる
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  #userがいいねしているかどうかの判定
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  #投稿一覧などのユーザーに紐づく投稿を複数取得する
  def posts
    return Post.where(user_id: self.id)
  end

  # フィードを返す
  def feed
    following_ids = "SELECT following_id FROM relationships
                    WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
