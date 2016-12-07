Rails.application.routes.draw do
  get 'home/index'

  resources :users

  get '/register', to: 'users#register'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  get '/choose_template', to: 'users#choose_template'

  get '/template_nr1', to: 'users#templates'
  get '/template_nr2', to: 'users#templates'
  get '/template_nr3', to: 'users#templates'

  get '/theme_nr1', to: 'users#themes'
  get '/theme_nr2', to: 'users#themes'
  get '/theme_nr3', to: 'users#themes'
  get '/theme_nr4', to: 'users#themes'
  get '/theme_nr5', to: 'users#themes'
  get '/theme_nr6', to: 'users#themes'

  get '/home', to: 'home#index'

  resources :users do
  	post :validate_login, :on => :collection
  end
  get '/esb', to: 'pages#index'
  root 'pages#index'
end
