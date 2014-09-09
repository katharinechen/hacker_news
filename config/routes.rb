Rails.application.routes.draw do


	root :to => 'links#index'

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  resources :links, :except => [:edit, :update] do
    resources :comments
  end

end
