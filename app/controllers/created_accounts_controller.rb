class CreatedAccountsController < ApplicationController
  
  def index

  	#search_dates = {
  	#	from_date: Date.today,
  	#	to_date: Date.today
  	#}
  	from_date = params[:from_date] || Date.today
  	to_date = params[:to_date] || Date.today
  	byebug
  	@created_accounts = CreatedAccount.where(registration_date: (from_date..to_date))
  end

end
