class BiddingsController < ApplicationController
	
	before_action :authenticate_user!


	def index
		@bidding = Product.find(params[:product_id]).biddings.all
	end

	def create
		@product = Product.find(params[:product_id])
		@bidding = @product.biddings.create(params[:bidding].permit(:reason, :amount))
		@bidding.user_id = current_user.id if current_user
		
		if @bidding.save
			redirect_to product_path(@product)
		else
			flash[:invalid] = "Debe ingresar un motivo y monto válidos."
			redirect_to product_path(@product)
		end
	end

end
