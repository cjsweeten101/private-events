Rails.application.routes.draw do
	root 'events#index'

	get    '/login',  to: 'sessions#new'
	post   '/login',  to: 'sessions#create'
	delete '/logout', to: 'sessions#delete'
	resources :users, only: [:new, :create, :show]
	resources :events, only: [:index, :new, :create, :show]
	post   '/attend', to: 'events#attend'
end
