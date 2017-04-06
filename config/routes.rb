require "resque_web"
require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post 'bot_actions/process_user_input'
      resources :events
      resources :schedules
      resources :posts
      resources :user_says
      resources :acts
      resources :lessons
      resources :bots
      devise_for :users
      mount ResqueWeb::Engine => "/resque_web"
    end
    # scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #   resources :products
    # end
  end


  resources :events
  resources :schedules
  resources :posts
  resources :user_says
  resources :acts
  resources :lessons
  resources :bots
  post 'bot_actions/process_user_input'
  

  mount ResqueWeb::Engine => "/resque_web"


  
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
