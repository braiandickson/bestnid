Rails.application.routes.draw do

  get 'passwords/change'

  	get 'created_accounts/index'

	put '/biddings/:id', to: 'biddings#set_as_winning', as: "bidding"
	get '/biddings/list_active', to: "biddings#list_active"
	patch '/biddings/:id', to: "biddings#update"

	get '/products/concluded', to: "products#concluded"
	get '/products/my_auctions', to: "products#my_auctions"

	resources :products do
		resources :biddings
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }
	resources :users, :only => [:index]
	resources :categories, :except => [:show, :destroy]

end
