Rails.application.routes.draw do
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index', as: 'home'
  # get 'about' => 'pages#about', as: 'about'
  get 'search' => 'posts#search'
  get 'test' => 'posts#test'
  
  resources :posts do
      resources :comments
  end


  
end