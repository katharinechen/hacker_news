Rails.application.routes.draw do

	root :to => 'links#popular'

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'popular', to: 'links#popular' 

  resources :users, except: [:index, :destroy]
  resources :sessions
  resources :votes, except: [:index, :edit, :update, :show, :destroy]

  resources :links, except: [:edit, :update, :destroy] do
    resources :comments, except: [:index, :edit, :update, :destroy]
  end
end
