Rails.application.routes.draw do

	put '/biddings/:id', to: 'biddings#update', as: "bidding"

	resources :products do
		resources :biddings
		resources :inquiries
	end



	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
