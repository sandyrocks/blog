Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users
  root 'home#index'
end
