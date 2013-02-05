BaseApp::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match "/admin" => "admin/base#index", :as => "admin"

  resources :pages
  resources :topics
  resources :posts
  resources :comments

  namespace "admin" do
    resources :users
  end

  root :to => "pages#index"

end
