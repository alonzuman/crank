Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/me', to: 'users#dashboard', as: 'me'
  get '/settings', to: 'users#settings', as: 'settings'
  resources :posts do
    # resources :likes, only: [:create]
    resources :comments, only: [:new, :create]
  end
  
  post '/posts/:id/like', to:'posts#like', as:'like_post'
  delete '/posts/:id/like', to:'posts#unlike', as:'unlike_post'

  post '/saves/:id', to:'posts#save', as:'save_post'
  delete '/saves/:id', to:'posts#unsave', as:'unsave_post'
  
  get 'me/saved', to:'saves#index', as:'my_saved_posts'

  resources :likes, only: [:destroy]
  resources :destroy, only: [:destroy]
  get '/discover', to:'posts#discover', as: 'discover'
  get '/users/:id', to: 'users#show', as: 'users' # TODO make it auto redirect to '/me' when :id == current_user[:id]
  get '/users/:id/follow', to: 'users#follow', as: 'follow'
  get '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  get '/users/:id/followers', to:'users#followers', as: 'followers'
end
