Rails.application.routes.draw do
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
}
  root 'static_pages#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
