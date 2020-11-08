class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 20 }
  mount_uploader :image, ImageUploader
  #投稿に紐付くユーザーの情報を取得する
  def user
    return User.find_by(id: self.user_id)
  end
end
