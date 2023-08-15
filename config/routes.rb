Rails.application.routes.draw do
  resources :users only: [:new, :create]
  resources :user_sessions only: [:new, :create, :destroy]
  root "staticpages#top"
end
