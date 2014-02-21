Codium::Application.routes.draw do

  resources :posts do
  	resources :comments
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get '/me/drafts', to: 'posts#draft_posts'  
  get '/about', to: 'pages#about'

  root :to => 'pages#home'
end
