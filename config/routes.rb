Rails.application.routes.draw do

  devise_for :users
  get 'dashboard' => 'dashboard#show', as: :dashboard
  get 'dashboard/:filter' => 'dashboard#show'
  get 'search' => 'search#index'
  
  authenticate :user do
     get "posts/:id/connect" => 'posts#connect', as: :post_connect
     delete "posts/:id" => 'posts#destroy', as: :destroy_post
     get "profiles/:id" => 'profiles#show', as: :profile
     resources :posts, only: [:new, :create, :edit, :update, :destroy, :show] do
     	resources :reviews, only: [:new, :create, :edit, :update, :destroy]
     end
     resources :users, only: [:show, :index, :edit, :destroy, :update]
   end
  get 'home' => 'home#index', as: :after_sign_out_path_for
  root 'home#index'
end
