Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "posts/search" => "posts#search"

  resources :users, only: [:index, :show, :edit]
  resources :posts, only: [:index, :new, :show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get "users/:id/liked" => "users#liked"

  root 'posts#index'
end
