class InquiriesController < ApplicationController

	def index
		@inquiries = Inquiry.order("created_at")
	end

	def create
		@product = Product.find(params[:product_id])
		@inquiry = @product.inquiries.create(params[:inquiry].permit(:question))
		@inquiry.user_id = current_user.id if current_user

		if @inquiry.save
			flash[:notice] = "Pregunta enviada con éxito!"
			redirect_to product_path(@product)
		else
			flash[:invalid] = "La pregunta no puede ser vacía y debe tener 250 caracteres como máximo."
			redirect_to product_path(@product)
		end

	end

	def update
		@product = Product.find(params[:product_id])
		@inquiry = @product.inquiries.find_by(id: params[:id])
		#byebug
		if !inquiry_params[:answer].blank? && @inquiry.update(inquiry_params)
			flash[:notice] = "Pregunta respondida con éxito!"
      		redirect_to product_path(@product)
    	else
    		flash[:invalid] = "La respuesta no puede ser vacía y debe tener 250 caracteres como máximo."
      		redirect_to product_path(@product)
      	end

	end

	def new
	end

	private

	def inquiry_params
		params.require(:inquiry).permit(:answer)
	end


end
