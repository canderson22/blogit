Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :blogs
  end
  
  resources :sessions, only: [:new, :create]

  # other routes for users
  post '/users/:id/edit' => 'users#update'
  delete '/users/:id/delete' => 'users#destroy', as: :delete_user

  # other routes for blogs
  post '/users/:user_id/blogs/:id/edit' => 'blogs#update'
  post  '/users/:id/blogs/new' => 'blogs#create'
  delete '/users/:user_id/blogs/:id' => 'blogs#destroy', as: :delete_user_blog

  resources :categories do
    resources :public_blogs, only: [:show] do
      resources :comments
    end
  end

  resources :categories, only: [:show]


  delete '/logout' => 'sessions#destroy', as: :logout
end
