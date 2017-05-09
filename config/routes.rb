Rails.application.routes.draw do

  resources :categories
  resources :requests
  mount RailsAdmin::Engine => '/rabbit', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }

  resources :listings do
    collection do
      get :recent
      get :trending
      get :worst_rated
    end
    
    resources :reviews, except: [:show, :index] do
      put "upvote", to: "reviews#upvote"
      put "downvote", to: "reviews#downvote"
      resources :user
    end
  end

  get 'pages/about'

  get 'pages/how'

  get 'pages/faqs'

  get 'pages/contact'

  get 'pages/privacy'

  get 'pages/tos'

  get 'pages/guidelines'

  get "/search" => "pages#search",   as: :search

  # root 'listings#index'
  root 'pages#home'

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
