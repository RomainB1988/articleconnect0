Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'home/index'
  root to: 'home#index'

  resources :posts, only: [:new, :create]
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end
end
