Rails.application.routes.draw do
  root 'users#index'
  resources :users

  post '/users/:id/edit' => 'users#update'
  delete '/users/:id/delete' => 'users#destroy', as: :delete_user

  resources :sessions, only: [:new, :create]

  resources :categories, only: [:show]

  resources :blogs
  post '/blogs/new' => 'blogs#create'
  patch '/blogs/:id/edit' => 'blogs#update'
  delete '/blogs/:id/delete' => 'blogs#destroy', as: :delete_blog

  
  delete '/logout' => 'sessions#destroy', as: :logout
end
