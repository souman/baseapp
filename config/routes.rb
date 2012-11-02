BaseApp::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match "/admin" => "admin/base#index", :as => "admin"

  resources :pages
  namespace "admin" do

    resources :users

  end

  root :to => "pages#index"
  match "*rest" => "pages#index"

end
