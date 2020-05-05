Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/me', to: 'users#dashboard'
  get '/users/:id', to: 'users#show' # TODO make it auto redirect to '/me' when :id == current_user[:id]
  get '/users/:id/follow', to: 'users#follow', as: 'follow'
  get '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
end
