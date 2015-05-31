class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update,:destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@products = Product.order("created_at DESC")
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to @product, notice: "Creado con exito!"
		else
			render 'new'
		end
	end

	def show

	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to @product, notice: "Actualizado con exito!"
		else
			render 'edit'
		end
	end

	def destroy
	end


	private

	def product_params
		params.require(:product).permit(:name, :description, :state, :period, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end
