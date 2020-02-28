Rails.application.routes.draw do

  resources :definitions
  resources :emoquestions do

  member do
    
    get 'success'
    get 'failure'
    post 'check'
    get 'failed'
  end
end



  root 'welcome#index'
end