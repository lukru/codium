Codium::Application.routes.draw do

  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  get '/about', to: 'pages#about'

  get ':action' => "pages#:action"
  root :to => 'pages#home'
end
