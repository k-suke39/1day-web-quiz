Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'users/new'
  get 'users/create'
  root "staticpages#top"
end
