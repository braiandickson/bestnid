Rails.application.routes.draw do
	
  resources :inquiries

	resources :products

	root "products#index"
	
	devise_for :users, :controllers => { registrations: 'registrations' }

end
