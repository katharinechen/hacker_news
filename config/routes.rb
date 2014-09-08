Rails.application.routes.draw do


	root :to => 'application#index'

  resources :users 
  
  resources :links do 
    resources :comments 
  end 

end
