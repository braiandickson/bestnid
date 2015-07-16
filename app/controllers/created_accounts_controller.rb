class CreatedAccountsController < ApplicationController
  
  def index

  	params[:search_dates] ||= {
  		date_from: Date.today,
  		date_to: Date.today
  		}

  	date_from = params[:search_dates][:date_from] #|| Date.today
  	date_to = params[:search_dates][:date_to] #|| Date.today

  	if date_from <= date_to
  		@created_accounts = CreatedAccount.where(registration_date: (date_from..date_to))
  	else
  		@created_accounts = []
			flash[:invalid] = "Por favor, ingrese un rango de fechas válido."
  	end

  end

end
