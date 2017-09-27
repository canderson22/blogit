Rails.application.routes.draw do

  root 'users#index'
  resources :users do
    resources :blogs
  end
  resources :users, only: [:singular] do
    resources :comments, only: [:index, :edit, :update, :destroy]
  end
  post '/users/:user_id/comments/:id/edit' => 'comments#update'
  
  resources :sessions, only: [:new, :create]

  # other routes for users
  post '/users/:id/edit' => 'users#update'
  delete '/users/:id/delete' => 'users#destroy', as: :delete_user

  # other routes for blogs
  post '/users/:user_id/blogs/:id/edit' => 'blogs#update'
  post  '/users/:id/blogs/new' => 'blogs#create'
  delete '/users/:user_id/blogs/:id' => 'blogs#destroy', as: :delete_user_blog

  resources :categories, only: [:show] do
    resources :public_blogs, only: [:show] do
      resources :comments, only: [:new, :create]
    end
  end

  # resources :public_blogs, only: [:show] do
  #   resources :comments
  # end

  post '/categories/:category_id/public_blogs/:public_blog_id/comments/new' => 'comments#create'



  delete '/logout' => 'sessions#destroy', as: :logout
end
