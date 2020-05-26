Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users do
    collection do
      get "log_out"
      get "card"
      get "delivery_address"
      get "user_information"
    end
  end
  resources :items 
end

