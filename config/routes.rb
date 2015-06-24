Rails.application.routes.draw do
	

	resources :products do
		resources :biddings
		resources :inquiries
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
