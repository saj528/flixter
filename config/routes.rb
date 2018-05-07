Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :static_pages
  resources :courses, only: [:index, :show]
  namespace :instructor do
    resources :courses, only: [:new, :create, :show]
      resources :sections, only: [:new, :create]
  end
end
