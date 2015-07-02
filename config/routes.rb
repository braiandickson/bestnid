Rails.application.routes.draw do

	put '/biddings/:id', to: 'biddings#update', as: "bidding"
	get '/biddings/list_active', to: "biddings#list_active"

	resources :products do
		resources :biddings
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }
	resources :users, :only => [:index]
end
