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
end