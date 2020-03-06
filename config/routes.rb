Rails.application.routes.draw do

  #get 'menu/index'
  #get '/intro' => 'menu#intro'
  get '/contact' => 'menu#contact'
  get '/about' => 'menu#about'
  resources :definitions
  resources :stories
  resources :emoquestions do

  member do
    
    get 'success'
    get 'failure'
    post 'check'
    get 'failed'
  end
end

  
  root 'menu#index'
end