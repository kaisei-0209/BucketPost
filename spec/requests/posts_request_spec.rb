require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#new" do
    context "未ログインの場合" do
      it "ログインページにリダイレクトされること" do
        get new_post_path
        expect(response).to have_http_status 302
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

    describe "#create" do
      context "未ログイン状態の場合" do
        it "ログインページにリダイレクトされること" do
          post_params = attributes_for(:post)
          post posts_path, params: { post: post_params }
          expect(response).to have_http_status 302
          expect(response).to redirect_to "/users/sign_in"
        end
      end
    end

    describe "#edit" do
      context "未ログイン状態の場合" do
        it "ログインページにリダイレクトされること" do
          post = create(:post)
          get edit_post_path(post)
          expect(response).to have_http_status 302
          expect(response).to redirect_to "/users/sign_in"
        end
      end

      context "認可されていないユーザーがアクセスした場合" do
        # 投稿者とログインユーザーが異なる場合
        it "一覧ページにリダイレクトされること" do
          user = create(:user)
          user_post = create(:post, user: user)

          another_user = create(:user)
          sign_in another_user

          get edit_post_path(user_post)
          expect(response).to redirect_to root_path
        end
      end
    end

  describe "#update" do
    context "未ログイン状態の場合" do
      it "ログインページにリダイレクトされること" do
        post = create(:post)
        get edit_post_path(post)
        expect(response).to have_http_status 302
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "認可されていないユーザーがアクセスした場合" do
      it "投稿を更新できず、一覧ページにリダイレクトされること" do
        user = create(:user)
        user_post = create(:post, user: user, content: "今年はスカイダイビングをする")

        another_user = create(:user)
        sign_in another_user
        another_user_post_params = attributes_for(:post, content: "３ヶ月以内にスカイダイビングします")

        patch post_path(user_post), params: { post: another_user_post_params }
        expect(user_post.reload.content).to eq "今年はスカイダイビングをする"
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#destroy" do
    let!(:post) { create(:post) }

    context "未ログインの場合" do
      it "ログインページにリダイレクトされること" do
        delete post_path(post)
        expect(response).to have_http_status 302
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "認可されていないユーザーがアクセスした場合" do
      it "投稿を削除できず、一覧ページにリダイレクトされること" do
        another_user = create(:user)
        sign_in another_user
        expect { delete post_path(post) }.to change { Post.count }.by(0)
        expect(response).to redirect_to root_path
      end
    end
  end
end
