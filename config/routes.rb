Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :movies, only: [:index, :new, :create] do
    collection do
      get 'exists'
    end
  end
  resources :user_movies, only: [:create, :update]

  post '/submit_ratings', to: 'ratings#submit'
  get '/users', to: 'users#index'
  get 'job_status/:job_id', to: 'jobs#status'
  post '/movies', to: 'movies#create'
  post '/users',   to: 'users#create'
  post 'import_movies', to: 'movies#import'  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
  