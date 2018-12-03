# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :author do
    resources :posts
  end

  root 'posts#index'
  resources :posts, only: %i(index show)
  resources :relationships, only: %i(create destroy)

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
end
