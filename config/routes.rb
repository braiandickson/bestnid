Rails.application.routes.draw do

	put '/products/:product_id/biddings/:id', to: 'biddings#set_as_winning', as: "bidding"
	get '/biddings/list_active', to: "biddings#list_active"
	patch '/biddings/:id', to: "biddings#update"

	resources :products do
		resources :biddings
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }
	resources :users, :only => [:index]
end
