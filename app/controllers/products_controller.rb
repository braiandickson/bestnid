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

		@products = Product.where(:state == 'finished').order("created_at DESC")


		=begin
			if params[:date_from].present? && params[:date_to].present?
				byebug
				@products = Product.where(:update_at => params[:c1]..params[:c2]).order("name DESC")
			else
				if params[:c1].present?
					@users = User.where(:created_at => params[:q1][:c1]..Date.today).not(email: 'admin@test.com')
				elsif params[:c2].present?
					#@users = User.where(:created_at => User.first..params[:q2] ).not(email: 'admin@test.com')
					@users = User.where.not(email: 'admin@test.com').order("name ASC")
				else
					@users = User.find(4)
				end
			end
		=end



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
