class WinnerController < ApplicationController

	def show
		@winner = Product.find(params[:product_id]).biddings.all
	end

	def create
		@product = Product.find(params[:product_id])
		@bidding = Bidding.find(params[:bidding_id])
		@winner.product_id = @product
		@winner.bidding_id = @bidding
		@winner.save

		if @winner.save
			redirect_to product_path(@product)
		else
			render 'show'
		end
	end

end
