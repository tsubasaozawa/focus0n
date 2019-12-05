Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # get "posts/search" => "posts#search"

  resources :users, only: [:index, :show, :edit] do
    member do 
      get :liked 
    end
  end

  resources :posts, only: [:new, :show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get :search
    end
  end
end
