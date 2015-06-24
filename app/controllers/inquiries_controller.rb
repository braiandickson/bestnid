class InquiriesController < ApplicationController

	def index
		@inquiries = Inquiry.order("created_at")
	end

	def create
		byebug
		redirect_to :controller => 'product', :action => 'add_inquiry' , :id => params[:id]
	end

	def new
	end

end
