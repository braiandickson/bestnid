class InquiriesController < ApplicationController

	def index
		@inquiries = Inquiry.order("created_at")
	end

	def create
		@product = Product.find(params[:product_id])
		@inquiry = @product.inquiries.create(params[:inquiry].permit(:question))
		@inquiry.user_id = current_user.id if current_user
		if @inquiry.save
			redirect_to product_path(@product)
		else
			flash[:invalid] = "El campo de pregunta no puede ser vacío."
			redirect_to product_path(@product)
		end

	end

	def update
		@product = Product.find(params[:product_id])
		@inquiry = @product.inquiries.find_by(id: params[:id])
		#byebug
		if @inquiry.update(inquiry_params)
			flash[:notice] = "Pregunta respondida con éxito!"
      		redirect_to @product
    	else
      		render 'answer_questions'
    	end

	end

	def new
	end

	private

	def inquiry_params
		params.require(:inquiry).permit(:answer)
	end


end
