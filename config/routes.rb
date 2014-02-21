Codium::Application.routes.draw do

  # Users
  get 'users/show'
  get 'me/profile' => 'Users#profile'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }


  resources :posts
  root :to => "pages#home" 
end
