require "resque_web"
require 'api_constraints'

Rails.application.routes.draw do

  resources :subscriptions
  resources :checks
  resources :keys
  resources :entities
  resources :samples
  # resources :events
  resources :schedules
  resources :posts
  resources :user_says
  resources :acts
  resources :lessons
  resources :bots
  resources :users
  post 'bot_actions/process_user_input'
  post 'entities/create_check_entity'
  mount ResqueWeb::Engine => "/resque_web"
  devise_for :users, :path_prefix => 'my'
  root to: 'home#index'
  
  # API
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :bots do
        member do
          get :all_bot_actions
          # get :lessons
        end
      end
      # resources :bots 
      post 'bot_actions/process_user_input'
      # resources :events
      resources :subscriptions
      resources :schedules
      resources :posts
      resources :entities
      resources :user_says
      resources :acts
      resources :lessons
      resources :users
      devise_for :users, :path_prefix => 'my'
      mount ResqueWeb::Engine => "/resque_web"
    end
    # scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #   resources :products
    # end
  end

end
