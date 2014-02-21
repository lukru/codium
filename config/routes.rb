Codium::Application.routes.draw do

  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get '/me/drafts', to: 'posts#draft_posts'

  root :to => 'pages#home'
  
  get ':action' => "pages#:action"
end
