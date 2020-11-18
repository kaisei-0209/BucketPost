Rails.application.routes.draw do
  devise_for :users, controllers: {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
}

devise_scope :user do
  get "sign_in", :to => "users/sessions#new"
  get "sign_out", :to => "users/sessions#destroy"
end
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :users, only: [:show, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get :popular
    end
  end
  root 'posts#index'
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
