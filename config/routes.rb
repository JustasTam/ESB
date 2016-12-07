Rails.application.routes.draw do
  resources :users

  get '/register', to: 'users#register'
  get '/login', to: 'users#login'
  get '/choose_template', to: 'users#choose_template'

  # templates
  get '/template_nr1', to: 'users#template_nr1'

  resources :users do
  	post :validate_login, :on => :collection
  end
  root 'pages#index'
end
