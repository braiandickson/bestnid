class ProductsController < ApplicationController
	before_action :find_product, only:[:show, :edit, :update, :destroy]

	def index
		@products = Product.all.order("created_at DESC")
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(pin_params)
		if @product.save
			redirect_to @pin, notice: "Producto creado con exito."
		else
			render 'new'
		end
	end




	private

	def product_params
		params.require(:product).permit(:name, :description, :state, :due_date, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end

end
