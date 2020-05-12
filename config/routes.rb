Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/me', to: 'users#dashboard', as: 'me'
  resources :posts do
    resources :likes, only: [:create]
  end
  resources :likes, only: [:destroy]
  get '/discover', to:'posts#discover', as: 'discover'
  get '/users/:id', to: 'users#show', as: 'users' # TODO make it auto redirect to '/me' when :id == current_user[:id]
  get '/users/:id/follow', to: 'users#follow', as: 'follow'
  get '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  get '/users/:id/followers', to:'users#followers', as: 'followers'
end
