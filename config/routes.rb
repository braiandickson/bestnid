Rails.application.routes.draw do
	
  resources :inquiries

	resources :products do
		resources :biddings
		resources :winners
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
