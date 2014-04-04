Codium::Application.routes.draw do

  # index will stay outside and
  # other jobs actions will be under users
  get '/jobs' => 'jobs#index'
  

  resources :skills

  resources :posts do
  	resources :comments
  end

  # Users
  devise_for :users, :controllers => { :registrations => "registrations" } 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'me/profile' => 'users#profile', as: :my_profile
  get '/users' => 'users#index'
  get 'me/profile' => 'users#profile'

  resources :users

  # post '/users/createstudent' => 'users#createstudent'
  # post '/users/:username' => 'users#delete'

  # get '/users/:username' => 'users#show' # , as: :user

  # get 'users/:id' => 'users#show'
  
  resources :projects

  resources :memberships

  resources :posts

  get '/me/drafts', to: 'posts#draft_posts'
  get '/about', to: 'pages#about'
  get '/team' => 'pages#team'

  root :to => 'pages#home'

  # a catch-all for new pages so they always have a route... so we don't have to make one every time!
  # EG, get :blogfeed => 'pages#:blogfeed'
  # OR  get :hamburger => 'pages#:hamburger'
  get ':action' => 'pages#:action'
end
