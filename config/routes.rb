Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # post '/users/changepassword', to: 'user#update_password'

      resources :replies
      resources :comments
      resources :posts
      resources :categories
      resources :users
    end
    
  end
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'

  root :to => 'home#index'

  resources :sessions, only: [:create]

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
