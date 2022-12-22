Rails.application.routes.draw do
  root 'blogs#index'

  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :users do
    member do
      get :favorite_blog
    end
  end
end
