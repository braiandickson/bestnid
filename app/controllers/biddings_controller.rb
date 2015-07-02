class BiddingsController < ApplicationController
	
	before_action :authenticate_user!


	def index
		@biddings = Product.find(params[:product_id]).biddings.all
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

	def update
		@biddings = current_user.biddings
		@bidding = Bidding.find_by(id: params[:id])

		if !bidding_params[:amount].blank? && @bidding.update(bidding_params)
    	flash[:notice] = "Monto actualizado con éxito!"
    else
    	flash[:invalid] = "Por favor, ingrese un monto válido."
    end

    render 'list_active'
		
	end

	def set_as_winning
		@bidding = Bidding.find(params[:id])
		@bidding.update(:is_winner => true)
		@bidding.product.update(:state => 'finished')
		redirect_to product_path(params[:product_id])
		flash[:notice] =  "Ud. ha elegido un ganador! Estamos procesando el cobro de su comisión. Gracias por operar con nosotros!"
	end

	def list_active
		@biddings = Bidding.select { |b| b.user == current_user }
	end

	private

	def bidding_params
		params.require(:bidding).permit(:amount)
	end

end
