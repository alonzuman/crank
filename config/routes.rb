Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'users#show' # TODO make it auto redirect to '/me' when :id == current_user[:id]
  # resources :follow, only: [:create, :destroy]
  
  get '/follows', to: 'users#follow'
end
