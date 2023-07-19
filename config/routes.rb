Rails.application.routes.draw do
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'home/index'
  # root to: "pages#home"
  root to: 'home#index'

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
