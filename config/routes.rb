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
  resources :users, only: [:show]
  root 'static_pages#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
