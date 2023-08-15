Rails.application.routes.draw do
  get 'questions/new'

  root "staticpages#top"

  resources :users, only: [:new, :create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :answers, only: [:index, :show, :new ,:create]
end
