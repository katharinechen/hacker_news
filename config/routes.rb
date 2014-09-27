Rails.application.routes.draw do

	root :to => 'links#index'

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'popular', to: 'links#popular' 

  resources :users
  resources :sessions
  resources :votes

  resources :links do
    resources :comments
  end
end
