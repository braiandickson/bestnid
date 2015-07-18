class CategoriesController < ApplicationController

	before_action :find_category, only: [:edit, :update]

	def index
		@categories = Category.order("name")
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		#byebug
		if @category.save
			flash[:notice] = "Categoría creada!"
			redirect_to "/categories"
		else
			render 'new'
		end

	end

	def edit

	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Actualizada con éxito!"
			redirect_to "/categories"
		else
			render 'edit'
		end

	end

	def category_params
		params.require(:category).permit(:name, :hidden)
	end

	def find_category
		@category = Category.find_by(id: params[:id])

		if !@category
			redirect_to "/categories"
			flash[:notice] = "Lo sentimos. No se pudo procesar su solicitud."
		end
	end

end
