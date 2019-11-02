Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "users#index"
  root to: "clients#index" # 最終的にこっちをrootページに
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  } 
  
  devise_scope :user do
    # get "user/:id", :to => "users/registrations#new"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  resources :clients do
    resources :actions
    resources :affiliations
  end
  get "users" => "users#index" # 管理者のリストを表示

end