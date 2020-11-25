require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前、メアド、パスワードがあると有効な状態であること" do
    user = User.new(
      name: "タロウ",
      email: "taro@example.com",
      password: "123456",
    )
    expect(user).to be_valid
  end

  describe "存在性の検証" do
    it "名前がない場合、無効であること" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがない場合、無効であること" do
      @user.email = ""
      @user.valid?
      expect(@user).to_not be_valid
    end

    it "パスワードがない場合、無効であること" do
      @user.password = @user.password_confirmation = "" * 6
      @user.valid?
      expect(@user).to_not be_valid
    end
  end

  describe "文字数の検証" do
    it "名前が10文字以内の場合、有効であること" do
      @user.name = "a" * 10
      expect(@user).to be_valid
    end

    it "名前が11文字以上の場合、無効であること" do
      @user.name = "a" * 11
      @user.valid?
      expect(@user).to_not be_valid
    end

    it "自己紹介が200文字以内の場合、有効であること" do
      @user.profile = "a" * 200
      expect(@user).to be_valid
    end

    it "自己紹介が200文字を超える場合、無効であること" do
      @user.profile = "a" * 201
      @user.valid?
      expect(@user).to_not be_valid
    end

    it "メールアドレスが255文字以内の場合、有効であること" do
      @user.email = "a" * 243 + "@example.com"
      expect(@user).to be_valid
    end

    it "メールアドレスが255文字を超える場合、無効であること" do
      @user.email = "a" * 244 + "@example.com"
      @user.valid?
      expect(@user).to_not be_valid
    end

    it "パスワードが6文字以上の場合、有効であること" do
      @user.password = @user.password_confirmation = "a" * 6
      @user.valid?
      expect(@user).to be_valid
    end

    it "パスワードが6文字未満の場合、無効であること" do
      @user.password = @user.password_confirmation = "a" * 5
      @user.valid?
      expect(@user).to_not be_valid
    end
  end

  describe "一意性の検証" do
    it "重複したメールアドレスの場合、無効であること" do
      user1 = create(:user, name: "taro", email: "taro@example.com")
      user2 = build(:user, name: "jiro", email: user1.email)
      expect(user2).to_not be_valid
    end

    it "メールアドレスは大文字小文字を区別せず扱うこと" do
      create(:user, email: "sample@example.com")
      duplicate_user = build(:user, email: "SAMPLE@EXAMPLE.COM")
      duplicate_user.valid?
      expect(duplicate_user.errors).to be_added(:email, :taken, value: "sample@example.com")
    end
  end

  describe "パスワードの検証" do
    # it "パスワードと確認用パスワードが間違っている場合、無効であること" do
    #   @user.password = 'password'
    #   @user.password_confirmation = 'pass'
    #   expect(@user).to_not be_valid
    # end

    it "パスワードが暗号化されていること" do
      user = create(:user)
      expect(user.encrypted_password).to_not eq "password"
    end
  end

  describe "フォーマットの検証" do
    it "メールアドレスが正常なフォーマットの場合、有効であること" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US_ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end

    it "メールアドレスが不正なフォーマットの場合、無効であること" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.valid?
        expect(@user.errors).to be_added(:email, :invalid, value: invalid_address)
      end
    end
  end

end
