Rails.application.routes.draw do

  resources :emoquestions do

  member do
    
    get 'success'
    get 'failure'
    post 'check'
  end
end

  
  resources :ask
 
  root 'welcome#index'
end