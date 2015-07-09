class CreatedAccountsController < ApplicationController
  
  def index

  	params[:search_dates] ||= {
  		from_date: Date.today,
  		to_date: Date.today
  	}
  	@from_date = params[:search_dates][:from_date]
  	@to_date = params[:search_dates][:to_date]
  	@created_accounts = CreatedAccount.where(registration_date: (@from_date..@to_date))
  end

end
