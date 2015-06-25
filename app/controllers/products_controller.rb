class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]


	def index
	  if params[:search]
	  	params[:sort] ||= "name"
	    @products = Product.search(params[:search]).order(params[:sort])
	  elsif (params[:sort].eql? "name")
	  	@products = Product.order('lower(name)')
	  else
	  	@products = Product.order(params[:sort])
	  end
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to @product, notice: "Subasta creada!"
		else
			render 'new'
		end
	end

	def show
		byebug
		@inquiries = @product.inquiries
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
		@product.destroy
		redirect_to root_path
	end


	private

	def product_params
		params.require(:product).permit(:name, :description, :state, :period, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end

end
