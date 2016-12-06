Rails.application.routes.draw do
  resources :users

  get '/register', to: 'users#register'
  get '/login', to: 'users#login'
  get '/home', to: 'homes#home'

  resources :users do
  	post :check_logins, :on => :collection
  end
  root 'pages#index'
end
