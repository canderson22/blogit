Rails.application.routes.draw do
  root 'users#index'
  resources :users

  post '/users/:id/edit' => 'users#update'
  post '/users/:id/delete' => 'users#destroy', as: :delete_user

  resources :sessions, only: [:new, :create]

  resources :categories, only: [:show]

  
  delete '/logout' => 'sessions#destroy', as: :logout
end
