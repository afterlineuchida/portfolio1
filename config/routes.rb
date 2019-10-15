Rails.application.routes.draw do
  get 'group_users/new'
  get 'sessions/new'
  get 'member_users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  get "/users" => "users#new"
  get '/users/messages', to: 'users#messages'
  get '/member_users/message_list', to: 'member_users#message_list'
 
  resources :users
  resources :member_users
  resources :group_users
  resources :messages
  
  
 
  
  get '/member_or_group', to: 'users#member_or_group'
  post '/member_or_group', to: 'users#create'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'  
  delete '/logout', to: 'sessions#destroy'
  
  get '/messages_new', to: 'users#messages_new'
  post '/messages_new', to: 'users#index'
  
  # post '/users_follows', to: 'users#follows'
  # delete '/users_followers', to: 'users#follows'
  post '/follows', to: 'follows#create'
  delete '/follows', to: 'follows#destroy'
end
