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

	def concluded

		params[:search_dates] ||= {
  		date_from: Date.today,
  		date_to: Date.today
  		}
  		date_from = params[:search_dates][:date_from] || Date.today
  		date_to = params[:search_dates][:date_to] || Date.today
  		@biddings = Bidding.where(is_winner: true).select {|b| b.updated_at.between?(date_from, date_to)}
  		@products = @biddings.map { |b| b.product }
  		#@products = Product.where.join(@biddings)
  		#params[:search_dates][:date_from]..params[:search_dates][:date_to]

	end

	def my_auctions
		@products = current_user.products
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			flash[:notice] =  "Subasta creada!"
			redirect_to @product
		else
			render 'new'
		end
	end

	def show
		@inquiries = @product.inquiries
	end

	def edit
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "Actualizado con exito!"
			redirect_to @product
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
		#begin
			@product = Product.find(params[:id])
		
		#rescue =>e
		#	redirect_to root_path
		#	flash[:notice] =  "Lo sentimos. No se pudo procesar su solicitud."
		#end
	end

end
