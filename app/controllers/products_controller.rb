class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :get_categories, only: [:new, :create]


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
  	
  	if params[:search_dates]

			date_from = params[:search_dates][:date_from]
			date_to = params[:search_dates][:date_to]

			if date_from <= date_to
				date_to += ' 23:59:59.999999'				
				@winners = Bidding.where(is_winner: true)
				@biddings = @winners.where(
					"created_at >= :date_from AND created_at <= :date_to",
  				{date_from: date_from, date_to: date_to}
  				)

				@products = @biddings.map { |b| b.product }
				flash.now[:notice] = "Se ha generado el reporte."
			else
				@products = []
				flash[:invalid] = "Por favor, ingrese un rango de fechas válido."
			end

		else
			@products = []
			flash[:notice] = "Bienvenido al reporte de subastas concluidas"
		end

		render 'concluded'
	end

	def my_auctions
		@products = current_user.products.order("state DESC")
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
		params.require(:product).permit(:name, :description, :state, :period, :image, :category_id)
	end

	def find_product
			@product = Product.find_by(id: params[:id])
		
		if !@product
			redirect_to root_path
			flash[:notice] =  "Lo sentimos. No se pudo procesar su solicitud."
		end
	end

	def get_categories
		@categories = Category.where("hidden = ?", false).order("name")

		if !@categories
			redirect_to root_path
			flash[:notice] = "Lo sentimos. No se pudo procesar su solicitud."
		end
	end


end
