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
                  uniqueness: true,
                  length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX }
        #createアクションにのみpasswordを適用する
        validates :password, presence: true, length: { minimum: 6 }, on: :create
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

        #passowordなしでアップデートする
        def update_without_current_password(params, *options)
          params.delete(:current_password)

          if params[:password].blank? && params[:password_confirmation].blank?
            params.delete(:password)
            params.delete(:password_confirmation)
          end

          result = update_attributes(params, *options)
          clean_up_passwords
          result
        end
        mount_uploader :image, ImageUploader
        has_many :posts, dependent: :destroy

        #投稿一覧などのユーザーに紐づく投稿を複数取得する
        def posts
          return Post.where(user_id: self.id)
        end
end
