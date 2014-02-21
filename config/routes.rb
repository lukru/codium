Codium::Application.routes.draw do

  # Users
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'me/profile' => 'users#profile'
  get 'users/:display_name' => 'users#show'

  resources :posts

  get '/me/drafts', to: 'posts#draft_posts'

  root :to => 'pages#home'
  
  get ':action' => "pages#:action"
end
