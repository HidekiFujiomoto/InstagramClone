Rails.application.routes.draw do

  resources :contacts
  root to:'tops#index'

  resources :users, only: [:new,:create,:show]
  resources :sessions, only: [:new,:create,:destroy]
  resources :favorites, only: [:create, :destroy]

  resources :blogs do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
