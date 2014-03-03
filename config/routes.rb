Codium::Application.routes.draw do

  # index will stay outside and
  # other jobs actions will be under users
  get '/jobs' => 'jobs#index'
  

  resources :posts do
  	resources :comments
  end

  # Users

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    get '/jobs/new' => 'jobs#new'
    post 'jobs' => 'jobs#create'
  end

  get 'users/:id' => 'users#show'
  get 'me/profile' => 'users#profile'


  resources :posts

  get '/me/drafts', to: 'posts#draft_posts'  
  get '/about', to: 'pages#about'

  root :to => 'pages#home'
end
