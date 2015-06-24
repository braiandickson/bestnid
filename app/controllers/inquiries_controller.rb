class InquiriesController < ApplicationController

	def index
		@inquiries = Inquiry.order("created_at")
	end

	def create
		byebug
		
		@product = Product.find(params[:product_id])
		@inquiry = @product.inquiries.create(params[:inquiry].permit(:question))
		@inquiry.user_id = current_user.id if current_user
		@inquiry.save

		if @inquiry.save
			redirect_to product_path(@product)
		else
			render 'new'
		end

	end

	def new
	end

end
