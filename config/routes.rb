Rails.application.routes.draw do
  root 'posts#index'
  get 'hello/index'
  get 'posts/index' => 'posts#index'
end
