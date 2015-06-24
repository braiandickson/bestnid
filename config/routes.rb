Rails.application.routes.draw do
	
  resources :inquiries

	resources :products do
		resources :biddings
	end

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
