Rails.application.routes.draw do
  devise_for :users
  resources :articles do 
    resources :comments
  end 
  resources :categories
  root 'home#index'
  get '/dashboard' => 'dashboard#index'
end
