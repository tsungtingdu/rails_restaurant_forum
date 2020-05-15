# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurants#index'
  resources :restaurants, only: %i[index show] do
    resources :comments, only: %i[create destroy]

    collection do
      get :feeds
      get :ranking
    end

    member do
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end
  end
  resources :categories, only: %i[show]
  resources :users, only: %i[index show edit update]
  resources :followships, only: %i[create destroy]

  namespace :admin do
    resources :restaurants
    resources :categories
    root 'restaurants#index'
  end
end
