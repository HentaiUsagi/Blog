Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'hello/index'
  get 'posts/index' => 'posts#index'
  resources :posts
end
