Rails.application.routes.draw do

  root "staticpages#top"

  resources :users, only: [:new, :create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :answers, only: [:index, :show, :new ,:create]
  resources :questions, only: [:index, :show, :new ,:create]
  
end
