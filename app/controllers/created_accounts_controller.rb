class CreatedAccountsController < ApplicationController
  
  def index

#  	params[:search_dates] ||= {
#  		date_from: Date.today,
#  		date_to: Date.today
#  		}

  	if params[:search_dates]

  		date_from = params[:search_dates][:date_from]
  		date_to = params[:search_dates][:date_to]

	  	if date_from <= date_to
	  		@created_accounts = CreatedAccount.where(registration_date: (date_from..date_to))
	  		flash.now[:notice] = "Se ha generado el reporte."
	  	else
	  		@created_accounts = []
				flash.now[:invalid] = "Por favor, ingrese un rango de fechas válido."
	  	end

	  else
	  	@created_accounts = []
			flash.now[:notice] = "Bienvenido al reporte de usuarios registrados."
	  end

	  render 'index'

  end

end
