class ApplicationController < ActionController::Base
  #Usersテーブルにnameカラムを保存できるようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    # サインアップ時にname,profileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile])
    # アカウント編集の時にname,image,profileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end
end
