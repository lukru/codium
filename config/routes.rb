Codium::Application.routes.draw do

  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root :to => "pages#home" 
end
