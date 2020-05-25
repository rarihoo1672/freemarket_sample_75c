Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'users/log_out', to: 'users#log_out'
  get 'users/card', to: 'users#card'
  get 'users/delivery_address', to: 'users#delivery_address'
  get 'users/user_information', to: 'users#user_information'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: [:show]
end

