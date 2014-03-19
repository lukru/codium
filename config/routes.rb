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
    # get '/jobs/new' => 'jobs#new'
    # post 'jobs' => 'jobs#create'
    resources :jobs
  end


  get 'users/:id' => 'users#show'
  get 'me/profile' => 'users#profile'

  resources :projects

  resources :memberships


  get 'me/profile' => 'users#profile', as: :my_profile

  get 'users/:username' => 'users#show' #, as: :user


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
