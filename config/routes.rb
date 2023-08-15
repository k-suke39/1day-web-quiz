Rails.application.routes.draw do
  get 'answers/index'
  get 'answers/show'
  get 'answers/new'
  get 'answers/create'
  root "staticpages#top"

  resources :users, only: [:new, :create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
