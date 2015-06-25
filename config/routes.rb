Rails.application.routes.draw do
	

	resources :products do
		resources :biddings
		resources :winners
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
