Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'hello#index'
  # Defines the root path route ("/")
  # root "posts#index"
end
