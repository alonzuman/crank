Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts
  get '/me', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/users/:id/follow', to: 'users#follow', as: 'follow'
  get '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
end
