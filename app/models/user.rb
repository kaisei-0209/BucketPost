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
        validates :password, presence: true, length: { minimum: 6 }
end
