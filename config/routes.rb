Rails.application.routes.draw do

	put '/biddings/:id', to: 'biddings#set_as_winning', as: "bidding"
	get '/biddings/list_active', to: "biddings#list_active"
	patch '/biddings/:id', to: "biddings#update"

	get '/products/concluded', to: "products#concluded", as: "concluded"

	resources :products do
		resources :biddings
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }
	resources :users, :only => [:index]
end
