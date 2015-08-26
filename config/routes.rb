Rails.application.routes.draw do

  root 'sessions#new'

  #Login
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  put    'login'   => 'sessions#reset'
  get   'login/confirm'   => 'sessions#confirm'
  delete 'logout'  => 'sessions#destroy'

  #Conta e Menu
  get 'conta' => 'users#edit'
  get 'registro' => 'users#new'
  put 'home' => 'users#update'
  get 'home' => 'pages#home'
  
  #Clientes
  get 'cliente/cadastro' => 'clientes#new'
  get 'cliente/pesquisa' => 'clientes#index'
  post 'cliente/pesquisa' => 'clientes#search'
  post 'clientes/:id' => 'clientes#send_email'

  #Pets
  get 'pet/cadastro' => 'pets#new'
  get 'pet/pesquisa' => 'pets#index'
  post 'pet/pesquisa' => 'pets#search'
  get 'pet/cadastro/:id' => 'pets#new_with_cliente'

  #Produtos
  get 'medicamentos' => 'medicines#index'
  delete 'medicamentos.:id' => 'medicines#delete'
  post 'medicamentos' => 'medicines#create'
  put 'medicamentos' => 'medicines#update'

  resources :users
  resources :clientes
  resources :pets
  resources :medicines

  #errors
  #if Rails.env.production?
    get '404', :to => 'application#page_not_found'
    get '422', :to => 'application#server_error'
    get '500', :to => 'application#server_error'
  #end
end
