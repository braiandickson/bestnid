class UsersController < ApplicationController

	def index

		if params[:c1].present? && params[:c2].present?
			byebug
			@users = User.where(:created_at => params[:c1]..params[:c2]).order("name DESC")
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
	end
end
